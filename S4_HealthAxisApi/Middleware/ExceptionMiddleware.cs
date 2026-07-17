using System.Net;
using System.Text.Json;

namespace S4_HealthAxisApi.Middleware
{
    public class ExceptionMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly ILogger<ExceptionMiddleware> _logger;

        public ExceptionMiddleware(
            RequestDelegate next,
            ILogger<ExceptionMiddleware> logger)
        {
            _next = next;
            _logger = logger;
        }

        public async Task InvokeAsync(
            HttpContext context)
        {
            try
            {
                await _next(context);
            }
            catch (Exception ex)
            {
                await HandleExceptionAsync(
                    context,
                    ex);
            }
        }

        private async Task HandleExceptionAsync(
            HttpContext context,
            Exception exception)
        {
            context.Response.ContentType =
                "application/json";

            var statusCode =
                GetStatusCode(exception);

            var errorCode =
                GetErrorCode(exception);

            var responseMessage =
                statusCode == (int)HttpStatusCode.InternalServerError
                    ? "An unexpected error occurred."
                    : exception.Message;

            context.Response.StatusCode =
                statusCode;

            LogException(
                context,
                exception,
                statusCode,
                errorCode,
                responseMessage);

            var response = new ErrorResponse
            {
                Message = responseMessage,
                ErrorCode = errorCode,
                TraceId = context.TraceIdentifier
            };

            var json =
                JsonSerializer.Serialize(
                    response,
                    new JsonSerializerOptions
                    {
                        PropertyNamingPolicy =
                            JsonNamingPolicy.CamelCase
                    });

            await context.Response.WriteAsync(json);
        }

        private void LogException(
            HttpContext context,
            Exception exception,
            int statusCode,
            string errorCode,
            string responseMessage)
        {
            var requestPath =
                context.Request.Path.Value ?? string.Empty;

            var requestMethod =
                context.Request.Method;

            var traceId =
                context.TraceIdentifier;

            if (statusCode >= 500)
            {
                _logger.LogError(
                    exception,
                    """
                    ====================================
                    API ERROR OCCURRED
                    ====================================

                    Error Code     : {ErrorCode}
                    Status Code    : {StatusCode}
                    Path           : {RequestPath}
                    Method         : {RequestMethod}
                    Exception Type : {ExceptionType}
                    Message        : {ErrorMessage}
                    Trace Id       : {TraceId}

                    ====================================
                    """,
                    errorCode,
                    statusCode,
                    requestPath,
                    requestMethod,
                    exception.GetType().Name,
                    responseMessage,
                    traceId);

                return;
            }

            _logger.LogWarning(
                exception,
                """
                ====================================
                API HANDLED EXCEPTION
                ====================================

                Error Code     : {ErrorCode}
                Status Code    : {StatusCode}
                Path           : {RequestPath}
                Method         : {RequestMethod}
                Exception Type : {ExceptionType}
                Message        : {ErrorMessage}
                Trace Id       : {TraceId}

                ====================================
                """,
                errorCode,
                statusCode,
                requestPath,
                requestMethod,
                exception.GetType().Name,
                responseMessage,
                traceId);
        }

        private static int GetStatusCode(
            Exception exception)
        {
            return exception switch
            {
                KeyNotFoundException =>
                    (int)HttpStatusCode.NotFound,

                ArgumentException =>
                    (int)HttpStatusCode.BadRequest,

                InvalidOperationException =>
                    (int)HttpStatusCode.BadRequest,

                UnauthorizedAccessException =>
                    (int)HttpStatusCode.Unauthorized,

                _ =>
                    (int)HttpStatusCode.InternalServerError
            };
        }

        private static string GetErrorCode(
            Exception exception)
        {
            return exception switch
            {
                KeyNotFoundException =>
                    "NOT_FOUND",

                ArgumentException =>
                    "BAD_REQUEST",

                InvalidOperationException =>
                    "INVALID_OPERATION",

                UnauthorizedAccessException =>
                    "UNAUTHORIZED",

                _ =>
                    "INTERNAL_SERVER_ERROR"
            };
        }
    }

    public class ErrorResponse
    {
        public string Message { get; set; } =
            string.Empty;

        public string ErrorCode { get; set; } =
            string.Empty;

        public string TraceId { get; set; } =
            string.Empty;
    }
}

