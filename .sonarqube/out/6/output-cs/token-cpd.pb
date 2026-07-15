†
iC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxis.Blazor\Services\TokenAuthenticationHandler.cs
	namespace 	
S4_HealthAxis
 
. 
Blazor 
. 
Services '
{ 
public 

class &
TokenAuthenticationHandler +
:, -
DelegatingHandler. ?
{ 
private 
readonly 

IJSRuntime #

_jsRuntime$ .
;. /
public

 &
TokenAuthenticationHandler

 )
(

) *

IJSRuntime

* 4
	jsRuntime

5 >
)

> ?
{ 	

_jsRuntime 
= 
	jsRuntime "
;" #
} 	
	protected 
override 
async  
Task! %
<% &
HttpResponseMessage& 9
>9 :
	SendAsync; D
(D E
HttpRequestMessageE W
requestX _
,_ `
CancellationTokena r
cancellationToken	s Ñ
)
Ñ Ö
{ 	
var 
token 
= 
await 

_jsRuntime (
.( )
InvokeAsync) 4
<4 5
string5 ;
>; <
(< =
$str= S
,S T
$strU `
)` a
;a b
if 
( 
! 
string 
. 
IsNullOrWhiteSpace *
(* +
token+ 0
)0 1
)1 2
{ 
request 
. 
Headers 
.  
Authorization  -
=. /
new0 3%
AuthenticationHeaderValue4 M
(M N
$strN V
,V W
tokenX ]
)] ^
;^ _
} 
return 
await 
base 
. 
	SendAsync '
(' (
request( /
,/ 0
cancellationToken1 B
)B C
;C D
} 	
} 
} Ì
XC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxis.Blazor\Services\JwtParser.cs
	namespace 	
S4_HealthAxis
 
. 
Blazor 
. 
Services '
{ 
public 

static 
class 
	JwtParser !
{ 
public 
static 
IEnumerable !
<! "
Claim" '
>' (
ParseClaimsFromJwt) ;
(; <
string< B
jwtC F
)F G
{		 	
var

 
claims

 
=

 
new

 
List

 !
<

! "
Claim

" '
>

' (
(

( )
)

) *
;

* +
var 
payload 
= 
jwt 
. 
Split #
(# $
$char$ '
)' (
[( )
$num) *
]* +
;+ ,
var 
	jsonBytes 
= %
ParseBase64WithoutPadding 5
(5 6
payload6 =
)= >
;> ?
var 
keyValuePairs 
= 
JsonSerializer  .
.. /
Deserialize/ :
<: ;

Dictionary; E
<E F
stringF L
,L M
objectN T
>T U
>U V
(V W
	jsonBytesW `
)` a
;a b
if 
( 
keyValuePairs 
!=  
null! %
)% &
{ 
claims 
. 
AddRange 
(  
keyValuePairs  -
.- .
Select. 4
(4 5
kvp5 8
=>9 ;
new< ?
Claim@ E
(E F
kvpF I
.I J
KeyJ M
,M N
kvpO R
.R S
ValueS X
?X Y
.Y Z
ToStringZ b
(b c
)c d
??e g
$strh j
)j k
)k l
)l m
;m n
} 
return 
claims 
; 
} 	
private 
static 
byte 
[ 
] %
ParseBase64WithoutPadding 7
(7 8
string8 >
base64? E
)E F
{ 	
switch 
( 
base64 
. 
Length !
%" #
$num$ %
)% &
{ 
case 
$num 
: 
base64 
+= !
$str" &
;& '
break( -
;- .
case 
$num 
: 
base64 
+= !
$str" %
;% &
break' ,
;, -
} 
return 
Convert 
. 
FromBase64String +
(+ ,
base64, 2
)2 3
;3 4
} 	
} 
}   ˛
hC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxis.Blazor\Services\Interface\IPatientService.cs
	namespace 	
S4_HealthAxis
 
. 
Blazor 
. 
Services '
{ 
public 

	interface 
IPatientService $
{ 
Task 
< 
List 
< 

PatientDto 
> 
? 
> 
GetAllAsync  +
(+ ,
), -
;- .
Task 
< 

PatientDto 
? 
> 
GetByIdAsync &
(& '
int' *
id+ -
)- .
;. /
Task		 
<		 
List		 
<		 "
PatientSearchResultDto		 (
>		( )
?		) *
>		* +
SearchByNameAsync		, =
(		= >
string		> D
name		E I
)		I J
;		J K
Task

 
<

 

PatientDto

 
?

 
>

 
CreateAsync

 %
(

% &
CreatePatientDto

& 6
dto

7 :
)

: ;
;

; <
Task 
< 
bool 
> 
UpdateAsync 
( 
int "
id# %
,% &
UpdatePatientDto' 7
dto8 ;
); <
;< =
Task 
< 
bool 
> 
ActivateAsync  
(  !
int! $
id% '
)' (
;( )
Task 
< 
bool 
> 
DeactivateAsync "
(" #
int# &
id' )
)) *
;* +
} 
} ƒ
gC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxis.Blazor\Services\Interface\IDoctorService.cs
	namespace 	
S4_HealthAxis
 
. 
Blazor 
. 
Services '
{ 
public 

	interface 
IDoctorService #
{ 
Task 
< 
List 
< 
	DoctorDto 
> 
? 
> 
GetAllAsync *
(* +
string+ 1
?1 2
sortBy3 9
=: ;
null< @
,@ A
intB E
?E F
specialisationG U
=V W
nullX \
)\ ]
;] ^
Task 
< 
	DoctorDto 
? 
> 
GetByIdAsync %
(% &
int& )
id* ,
), -
;- .
Task		 
<		 #
DoctorCreationResultDto		 $
?		$ %
>		% &
CreateAsync		' 2
(		2 3
CreateDoctorDto		3 B
dto		C F
)		F G
;		G H
Task

 
<

 
bool

 
>

 
UpdateAsync

 
(

 
int

 "
id

# %
,

% &
UpdateDoctorDto

' 6
dto

7 :
)

: ;
;

; <
Task 
< 
bool 
> 
ActivateAsync  
(  !
int! $
id% '
)' (
;( )
Task 
< 
bool 
> 
DeactivateAsync "
(" #
int# &
id' )
)) *
;* +
} 
} Ê
eC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxis.Blazor\Services\Interface\IAuthService.cs
	namespace 	
S4_HealthAxis
 
. 
Blazor 
. 
Services '
{ 
public 

	interface 
IAuthService !
{ 
Task 
< 
bool 
> 

LoginAsync 
( 
LoginDto &
request' .
). /
;/ 0
Task 
LogoutAsync 
( 
) 
; 
}		 
}

 π
lC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxis.Blazor\Services\Interface\IAppointmentService.cs
	namespace 	
S4_HealthAxis
 
. 
Blazor 
. 
Services '
{ 
public 

	interface 
IAppointmentService (
{ 
Task 
< 
List 
< !
AppointmentDetailsDto '
>' (
?( )
>) *
GetAllAsync+ 6
(6 7
)7 8
;8 9
Task 
< !
AppointmentDetailsDto "
?" #
># $
GetByIdAsync% 1
(1 2
int2 5
id6 8
)8 9
;9 :
Task		 
<		 
List		 
<		 (
PatientAppointmentHistoryDto		 .
>		. /
?		/ 0
>		0 1"
GetPatientHistoryAsync		2 H
(		H I
int		I L
	patientId		M V
)		V W
;		W X
Task

 
<

 
List

 
<

 !
DoctorScheduleItemDto

 '
>

' (
?

( )
>

) *'
GetDoctorTodayScheduleAsync

+ F
(

F G
int

G J
doctorId

K S
)

S T
;

T U
Task 
< 
List 
< !
DoctorScheduleItemDto '
>' (
?( )
>) *&
GetDoctorWeekScheduleAsync+ E
(E F
intF I
doctorIdJ R
,R S
DateOnlyT \
	startDate] f
,f g
DateOnlyh p
endDateq x
)x y
;y z
Task 
< 
List 
< !
DoctorScheduleItemDto '
>' (
?( )
>) **
GetDoctorUpcomingScheduleAsync+ I
(I J
intJ M
doctorIdN V
)V W
;W X
Task 
< 
AppointmentDto 
? 
> 
CreateAsync )
() * 
CreateAppointmentDto* >
dto? B
)B C
;C D
Task 
< 
bool 
> 
UpdateAsync 
( 
int "
id# %
,% & 
UpdateAppointmentDto' ;
dto< ?
)? @
;@ A
Task 
< 
bool 
> 
UpdateStatusAsync $
($ %
int% (
id) +
,+ ,&
UpdateAppointmentStatusDto- G
dtoH K
)K L
;L M
Task 
< 
bool 
> 
ConfirmAsync 
(  
int  #
id$ &
)& '
;' (
Task 
< 
bool 
> 
CompleteAsync  
(  !
int! $
id% '
)' (
;( )
Task 
< 
bool 
> 
CancelAsync 
( 
int "
id# %
,% & 
CancelAppointmentDto' ;
dto< ?
)? @
;@ A
} 
} Ä
fC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxis.Blazor\Services\Interface\IAdminService.cs
	namespace 	
S4_HealthAxis
 
. 
Blazor 
. 
Services '
{ 
public 

	interface 
IAdminService "
{ 
Task 
< 
DashboardDto 
? 
> 
GetDashboardAsync -
(- .
). /
;/ 0
Task

 
<

 
StatisticsDto

 
?

 
>

 
GetStatisticsAsync

 /
(

/ 0
)

0 1
;

1 2
Task 
< 
List 
< 
UserManagementDto #
># $
?$ %
>% &
GetUsersAsync' 4
(4 5
)5 6
;6 7
} 
} ¯.
lC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxis.Blazor\Services\Implementation\PatientService.cs
	namespace 	
S4_HealthAxis
 
. 
Blazor 
. 
Services '
{ 
public 

class 
PatientService 
:  !
IPatientService" 1
{ 
private 
readonly 

HttpClient #
_httpClient$ /
;/ 0
public

 
PatientService

 
(

 

HttpClient

 (

httpClient

) 3
)

3 4
{ 	
_httpClient 
= 

httpClient $
;$ %
} 	
public 
async 
Task 
< 
List 
< 

PatientDto )
>) *
?* +
>+ ,
GetAllAsync- 8
(8 9
)9 :
{ 	
return 
await 
_httpClient $
.$ %
GetFromJsonAsync% 5
<5 6
List6 :
<: ;

PatientDto; E
>E F
>F G
(G H
$strH V
)V W
;W X
} 	
public 
async 
Task 
< 

PatientDto $
?$ %
>% &
GetByIdAsync' 3
(3 4
int4 7
id8 :
): ;
{ 	
return 
await 
_httpClient $
.$ %
GetFromJsonAsync% 5
<5 6

PatientDto6 @
>@ A
(A B
$"B D
$strD Q
{Q R
idR T
}T U
"U V
)V W
;W X
} 	
public 
async 
Task 
< 
List 
< "
PatientSearchResultDto 5
>5 6
?6 7
>7 8
SearchByNameAsync9 J
(J K
stringK Q
nameR V
)V W
{ 	
return 
await 
_httpClient $
.$ %
GetFromJsonAsync% 5
<5 6
List6 :
<: ;"
PatientSearchResultDto; Q
>Q R
>R S
(S T
$"T V
$strV o
{o p
namep t
}t u
"u v
)v w
;w x
} 	
public 
async 
Task 
< 

PatientDto $
?$ %
>% &
CreateAsync' 2
(2 3
CreatePatientDto3 C
dtoD G
)G H
{ 	
var   
response   
=   
await    
_httpClient  ! ,
.  , -
PostAsJsonAsync  - <
(  < =
$str  = K
,  K L
dto  M P
)  P Q
;  Q R
if!! 
(!! 
response!! 
.!! 
IsSuccessStatusCode!! ,
)!!, -
{"" 
return## 
await## 
response## %
.##% &
Content##& -
.##- .
ReadFromJsonAsync##. ?
<##? @

PatientDto##@ J
>##J K
(##K L
)##L M
;##M N
}$$ 
throw&& 
new&& 
	Exception&& 
(&&  
await&&  %
response&&& .
.&&. /
Content&&/ 6
.&&6 7
ReadAsStringAsync&&7 H
(&&H I
)&&I J
)&&J K
;&&K L
}'' 	
public)) 
async)) 
Task)) 
<)) 
bool)) 
>)) 
UpdateAsync))  +
())+ ,
int)), /
id))0 2
,))2 3
UpdatePatientDto))4 D
dto))E H
)))H I
{** 	
var++ 
response++ 
=++ 
await++  
_httpClient++! ,
.++, -
PutAsJsonAsync++- ;
(++; <
$"++< >
$str++> K
{++K L
id++L N
}++N O
"++O P
,++P Q
dto++R U
)++U V
;++V W
if,, 
(,, 
response,, 
.,, 
IsSuccessStatusCode,, ,
),,, -
{-- 
return.. 
true.. 
;.. 
}// 
throw00 
new00 
	Exception00 
(00  
await00  %
response00& .
.00. /
Content00/ 6
.006 7
ReadAsStringAsync007 H
(00H I
)00I J
)00J K
;00K L
}11 	
public33 
async33 
Task33 
<33 
bool33 
>33 
ActivateAsync33  -
(33- .
int33. 1
id332 4
)334 5
{44 	
var55 
response55 
=55 
await55  
_httpClient55! ,
.55, -
PutAsync55- 5
(555 6
$"556 8
$str558 E
{55E F
id55F H
}55H I
$str55I R
"55R S
,55S T
null55U Y
)55Y Z
;55Z [
return66 
response66 
.66 
IsSuccessStatusCode66 /
;66/ 0
}77 	
public99 
async99 
Task99 
<99 
bool99 
>99 
DeactivateAsync99  /
(99/ 0
int990 3
id994 6
)996 7
{:: 	
var;; 
response;; 
=;; 
await;;  
_httpClient;;! ,
.;;, -
PutAsync;;- 5
(;;5 6
$";;6 8
$str;;8 E
{;;E F
id;;F H
};;H I
$str;;I T
";;T U
,;;U V
null;;W [
);;[ \
;;;\ ]
return<< 
response<< 
.<< 
IsSuccessStatusCode<< /
;<</ 0
}== 	
}>> 
}?? ß1
kC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxis.Blazor\Services\Implementation\DoctorService.cs
	namespace 	
S4_HealthAxis
 
. 
Blazor 
. 
Services '
{ 
public 

class 
DoctorService 
:  
IDoctorService! /
{ 
private 
readonly 

HttpClient #
_httpClient$ /
;/ 0
public

 
DoctorService

 
(

 

HttpClient

 '

httpClient

( 2
)

2 3
{ 	
_httpClient 
= 

httpClient $
;$ %
} 	
public 
async 
Task 
< 
List 
< 
	DoctorDto (
>( )
?) *
>* +
GetAllAsync, 7
(7 8
string8 >
?> ?
sortBy@ F
=G H
nullI M
,M N
intO R
?R S
specialisationT b
=c d
nulle i
)i j
{ 	
var 
url 
= 
$str #
;# $
var 
query 
= 
new 
List  
<  !
string! '
>' (
(( )
)) *
;* +
if 
( 
! 
string 
. 
IsNullOrWhiteSpace *
(* +
sortBy+ 1
)1 2
)2 3
query 
. 
Add 
( 
$" 
$str #
{# $
sortBy$ *
}* +
"+ ,
), -
;- .
if 
( 
specialisation 
. 
HasValue '
)' (
query 
. 
Add 
( 
$" 
$str +
{+ ,
specialisation, :
.: ;
Value; @
}@ A
"A B
)B C
;C D
if 
( 
query 
. 
Any 
( 
) 
) 
url 
+= 
$str 
+ 
string #
.# $
Join$ (
(( )
$str) ,
,, -
query. 3
)3 4
;4 5
return 
await 
_httpClient $
.$ %
GetFromJsonAsync% 5
<5 6
List6 :
<: ;
	DoctorDto; D
>D E
>E F
(F G
urlG J
)J K
;K L
} 	
public   
async   
Task   
<   
	DoctorDto   #
?  # $
>  $ %
GetByIdAsync  & 2
(  2 3
int  3 6
id  7 9
)  9 :
{!! 	
return"" 
await"" 
_httpClient"" $
.""$ %
GetFromJsonAsync""% 5
<""5 6
	DoctorDto""6 ?
>""? @
(""@ A
$"""A C
$str""C O
{""O P
id""P R
}""R S
"""S T
)""T U
;""U V
}## 	
public%% 
async%% 
Task%% 
<%% #
DoctorCreationResultDto%% 1
?%%1 2
>%%2 3
CreateAsync%%4 ?
(%%? @
CreateDoctorDto%%@ O
dto%%P S
)%%S T
{&& 	
var'' 
response'' 
='' 
await''  
_httpClient''! ,
.'', -
PostAsJsonAsync''- <
(''< =
$str''= J
,''J K
dto''L O
)''O P
;''P Q
if(( 
((( 
response(( 
.(( 
IsSuccessStatusCode(( ,
)((, -
{)) 
return** 
await** 
response** %
.**% &
Content**& -
.**- .
ReadFromJsonAsync**. ?
<**? @#
DoctorCreationResultDto**@ W
>**W X
(**X Y
)**Y Z
;**Z [
}++ 
return,, 
null,, 
;,, 
}-- 	
public// 
async// 
Task// 
<// 
bool// 
>// 
UpdateAsync//  +
(//+ ,
int//, /
id//0 2
,//2 3
UpdateDoctorDto//4 C
dto//D G
)//G H
{00 	
var11 
response11 
=11 
await11  
_httpClient11! ,
.11, -
PutAsJsonAsync11- ;
(11; <
$"11< >
$str11> J
{11J K
id11K M
}11M N
"11N O
,11O P
dto11Q T
)11T U
;11U V
return22 
response22 
.22 
IsSuccessStatusCode22 /
;22/ 0
}33 	
public55 
async55 
Task55 
<55 
bool55 
>55 
ActivateAsync55  -
(55- .
int55. 1
id552 4
)554 5
{66 	
var77 
response77 
=77 
await77  
_httpClient77! ,
.77, -
PutAsync77- 5
(775 6
$"776 8
$str778 D
{77D E
id77E G
}77G H
$str77H Q
"77Q R
,77R S
null77T X
)77X Y
;77Y Z
return88 
response88 
.88 
IsSuccessStatusCode88 /
;88/ 0
}99 	
public;; 
async;; 
Task;; 
<;; 
bool;; 
>;; 
DeactivateAsync;;  /
(;;/ 0
int;;0 3
id;;4 6
);;6 7
{<< 	
var== 
response== 
=== 
await==  
_httpClient==! ,
.==, -
PutAsync==- 5
(==5 6
$"==6 8
$str==8 D
{==D E
id==E G
}==G H
$str==H S
"==S T
,==T U
null==V Z
)==Z [
;==[ \
return>> 
response>> 
.>> 
IsSuccessStatusCode>> /
;>>/ 0
}?? 	
}@@ 
}AA Ì3
iC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxis.Blazor\Services\Implementation\AuthService.cs
	namespace 	
S4_HealthAxis
 
. 
Blazor 
. 
Services '
{ 
public 

class 
AuthService 
: 
IAuthService +
{		 
private

 
readonly

 

HttpClient

 #
_httpClient

$ /
;

/ 0
private 
readonly 

IJSRuntime #

_jsRuntime$ .
;. /
private 
readonly '
AuthenticationStateProvider 4
_authStateProvider5 G
;G H
public 
AuthService 
( 

HttpClient 

httpClient !
,! "

IJSRuntime 
	jsRuntime  
,  !'
AuthenticationStateProvider '
authStateProvider( 9
)9 :
{ 	
_httpClient 
= 

httpClient $
;$ %

_jsRuntime 
= 
	jsRuntime "
;" #
_authStateProvider 
=  
authStateProvider! 2
;2 3
} 	
public 
async 
Task 
< 
bool 
> 

LoginAsync  *
(* +
LoginDto+ 3
request4 ;
); <
{ 	
var 
response 
= 
await 
_httpClient !
.! "
PostAsJsonAsync" 1
(1 2
$str $
,$ %
request 
) 
; 
if 
( 
! 
response 
. 
IsSuccessStatusCode -
)- .
{   
return!! 
false!! 
;!! 
}"" 
var$$ 
authResponse$$ 
=$$ 
await%% 
response%% 
.%% 
Content%% &
.&& 
ReadFromJsonAsync&& &
<&&& '
AuthResponseDto&&' 6
>&&6 7
(&&7 8
)&&8 9
;&&9 :
if(( 
((( 
authResponse(( 
==(( 
null((  $
||((% '
string)) 
.)) 
IsNullOrWhiteSpace)) )
())) *
authResponse))* 6
.))6 7
AccessToken))7 B
)))B C
)))C D
{** 
return++ 
false++ 
;++ 
},, 
await.. 
SaveAuthDataAsync.. #
(..# $
authResponse..$ 0
)..0 1
;..1 2
(00 
(00 #
CustomAuthStateProvider00 %
)00% &
_authStateProvider00& 8
)008 9
.11 $
NotifyUserAuthentication11 )
(11) *
authResponse11* 6
.116 7
AccessToken117 B
)11B C
;11C D
return33 
true33 
;33 
}44 	
public66 
async66 
Task66 
LogoutAsync66 %
(66% &
)66& '
{77 	
await88 
ClearAuthDataAsync88 $
(88$ %
)88% &
;88& '
(:: 
(:: #
CustomAuthStateProvider:: %
)::% &
_authStateProvider::& 8
)::8 9
.;; 
NotifyUserLogout;; !
(;;! "
);;" #
;;;# $
}<< 	
private>> 
async>> 
Task>> 
SaveAuthDataAsync>> ,
(>>, -
AuthResponseDto>>- <
authResponse>>= I
)>>I J
{?? 	
await@@ 

_jsRuntime@@ 
.@@ 
InvokeVoidAsync@@ ,
(@@, -
$strAA &
,AA& '
$strBB 
,BB 
authResponseCC 
.CC 
AccessTokenCC (
)CC( )
;CC) *
awaitEE 

_jsRuntimeEE 
.EE 
InvokeVoidAsyncEE ,
(EE, -
$strFF &
,FF& '
$strGG 
,GG 
authResponseHH 
.HH 
RefreshTokenHH )
)HH) *
;HH* +
awaitJJ 

_jsRuntimeJJ 
.JJ 
InvokeVoidAsyncJJ ,
(JJ, -
$strKK &
,KK& '
$strLL 
,LL 
authResponseMM 
.MM 
EmailMM "
)MM" #
;MM# $
awaitOO 

_jsRuntimeOO 
.OO 
InvokeVoidAsyncOO ,
(OO, -
$strPP &
,PP& '
$strQQ 
,QQ 
authResponseRR 
.RR 
RoleRR !
)RR! "
;RR" #
ifTT 
(TT 
authResponseTT 
.TT 
ReferenceIdTT (
.TT( )
HasValueTT) 1
)TT1 2
{UU 
awaitVV 

_jsRuntimeVV  
.VV  !
InvokeVoidAsyncVV! 0
(VV0 1
$strWW *
,WW* +
$strXX %
,XX% &
authResponseYY  
.YY  !
ReferenceIdYY! ,
.YY, -
ValueYY- 2
.YY2 3
ToStringYY3 ;
(YY; <
)YY< =
)YY= >
;YY> ?
}ZZ 
else[[ 
{\\ 
await]] 

_jsRuntime]]  
.]]  !
InvokeVoidAsync]]! 0
(]]0 1
$str^^ -
,^^- .
$str__ %
)__% &
;__& '
}`` 
}aa 	
privatecc 
asynccc 
Taskcc 
ClearAuthDataAsynccc -
(cc- .
)cc. /
{dd 	
awaitee 

_jsRuntimeee 
.ee 
InvokeVoidAsyncee ,
(ee, -
$strff )
,ff) *
$strgg 
)gg 
;gg 
awaitii 

_jsRuntimeii 
.ii 
InvokeVoidAsyncii ,
(ii, -
$strjj )
,jj) *
$strkk 
)kk 
;kk  
awaitmm 

_jsRuntimemm 
.mm 
InvokeVoidAsyncmm ,
(mm, -
$strnn )
,nn) *
$stroo 
)oo 
;oo 
awaitqq 

_jsRuntimeqq 
.qq 
InvokeVoidAsyncqq ,
(qq, -
$strrr )
,rr) *
$strss 
)ss 
;ss 
awaituu 

_jsRuntimeuu 
.uu 
InvokeVoidAsyncuu ,
(uu, -
$strvv )
,vv) *
$strww !
)ww! "
;ww" #
}xx 	
}yy 
}zz Ÿü
pC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxis.Blazor\Services\Implementation\AppointmentService.cs
	namespace 	
S4_HealthAxis
 
. 
Blazor 
. 
Services '
{ 
public 

class 
AppointmentService #
:$ %
IAppointmentService& 9
{ 
private 
readonly 

HttpClient #
_httpClient$ /
;/ 0
public

 
AppointmentService

 !
(

! "

HttpClient

" ,

httpClient

- 7
)

7 8
{ 	
_httpClient 
= 

httpClient $
;$ %
} 	
public 
async 
Task 
< 
List 
< !
AppointmentDetailsDto 4
>4 5
?5 6
>6 7
GetAllAsync8 C
(C D
)D E
{ 	
var 
response 
= 
await  
_httpClient! ,
., -
GetAsync- 5
(5 6
$str6 H
)H I
;I J
if 
( 
response 
. 
IsSuccessStatusCode ,
), -
{ 
return 
await 
response %
.% &
Content& -
. 
ReadFromJsonAsync &
<& '
List' +
<+ ,!
AppointmentDetailsDto, A
>A B
>B C
(C D
)D E
;E F
} 
var 
error 
= 
await 
response &
.& '
Content' .
.. /
ReadAsStringAsync/ @
(@ A
)A B
;B C
throw 
new 
	Exception 
(  
$" 
$str :
{: ;
(; <
int< ?
)? @
response@ H
.H I

StatusCodeI S
}S T
$strT V
{V W
errorW \
}\ ]
"] ^
)^ _
;_ `
} 	
public 
async 
Task 
< !
AppointmentDetailsDto /
?/ 0
>0 1
GetByIdAsync2 >
(> ?
int? B
idC E
)E F
{   	
var!! 
response!! 
=!! 
await!!  
_httpClient!!! ,
.!!, -
GetAsync!!- 5
(!!5 6
$"!!6 8
$str!!8 I
{!!I J
id!!J L
}!!L M
"!!M N
)!!N O
;!!O P
if## 
(## 
response## 
.## 
IsSuccessStatusCode## ,
)##, -
{$$ 
return%% 
await%% 
response%% %
.%%% &
Content%%& -
.&& 
ReadFromJsonAsync&& &
<&&& '!
AppointmentDetailsDto&&' <
>&&< =
(&&= >
)&&> ?
;&&? @
}'' 
var)) 
error)) 
=)) 
await)) 
response)) &
.))& '
Content))' .
.)). /
ReadAsStringAsync))/ @
())@ A
)))A B
;))B C
throw++ 
new++ 
	Exception++ 
(++  
$",, 
$str,, '
{,,' (
id,,( *
},,* +
$str,,+ ?
{,,? @
(,,@ A
int,,A D
),,D E
response,,E M
.,,M N

StatusCode,,N X
},,X Y
$str,,Y [
{,,[ \
error,,\ a
},,a b
",,b c
),,c d
;,,d e
}-- 	
public// 
async// 
Task// 
<// 
List// 
<// (
PatientAppointmentHistoryDto// ;
>//; <
?//< =
>//= >"
GetPatientHistoryAsync//? U
(//U V
int//V Y
	patientId//Z c
)//c d
{00 	
var11 
response11 
=11 
await11  
_httpClient11! ,
.11, -
GetAsync11- 5
(115 6
$"116 8
$str118 Q
{11Q R
	patientId11R [
}11[ \
"11\ ]
)11] ^
;11^ _
if33 
(33 
response33 
.33 
IsSuccessStatusCode33 ,
)33, -
{44 
return55 
await55 
response55 %
.55% &
Content55& -
.66 
ReadFromJsonAsync66 &
<66& '
List66' +
<66+ ,(
PatientAppointmentHistoryDto66, H
>66H I
>66I J
(66J K
)66K L
;66L M
}77 
var99 
error99 
=99 
await99 
response99 &
.99& '
Content99' .
.99. /
ReadAsStringAsync99/ @
(99@ A
)99A B
;99B C
throw;; 
new;; 
	Exception;; 
(;;  
$"<< 
$str<< /
{<</ 0
	patientId<<0 9
}<<9 :
$str<<: N
{<<N O
(<<O P
int<<P S
)<<S T
response<<T \
.<<\ ]

StatusCode<<] g
}<<g h
$str<<h j
{<<j k
error<<k p
}<<p q
"<<q r
)<<r s
;<<s t
}== 	
public?? 
async?? 
Task?? 
<?? 
List?? 
<?? !
DoctorScheduleItemDto?? 4
>??4 5
???5 6
>??6 7'
GetDoctorTodayScheduleAsync??8 S
(??S T
int??T W
doctorId??X `
)??` a
{@@ 	
varAA 
responseAA 
=AA 
awaitAA  
_httpClientAA! ,
.AA, -
GetAsyncAA- 5
(AA5 6
$"AA6 8
$strAA8 P
{AAP Q
doctorIdAAQ Y
}AAY Z
$strAAZ `
"AA` a
)AAa b
;AAb c
ifCC 
(CC 
responseCC 
.CC 
IsSuccessStatusCodeCC ,
)CC, -
{DD 
returnEE 
awaitEE 
responseEE %
.EE% &
ContentEE& -
.FF 
ReadFromJsonAsyncFF &
<FF& '
ListFF' +
<FF+ ,!
DoctorScheduleItemDtoFF, A
>FFA B
>FFB C
(FFC D
)FFD E
;FFE F
}GG 
varII 
errorII 
=II 
awaitII 
responseII &
.II& '
ContentII' .
.II. /
ReadAsStringAsyncII/ @
(II@ A
)IIA B
;IIB C
throwKK 
newKK 
	ExceptionKK 
(KK  
$"LL 
$strLL .
{LL. /
doctorIdLL/ 7
}LL7 8
$strLL8 R
{LLR S
(LLS T
intLLT W
)LLW X
responseLLX `
.LL` a

StatusCodeLLa k
}LLk l
$strLLl n
{LLn o
errorLLo t
}LLt u
"LLu v
)LLv w
;LLw x
}MM 	
publicOO 
asyncOO 
TaskOO 
<OO 
ListOO 
<OO !
DoctorScheduleItemDtoOO 4
>OO4 5
?OO5 6
>OO6 7&
GetDoctorWeekScheduleAsyncOO8 R
(OOR S
intPP 
doctorIdPP 
,PP 
DateOnlyQQ 
	startDateQQ 
,QQ 
DateOnlyRR 
endDateRR 
)RR 
{SS 	
varTT 
responseTT 
=TT 
awaitTT  
_httpClientTT! ,
.TT, -
GetAsyncTT- 5
(TT5 6
$"UU 
$strUU *
{UU* +
doctorIdUU+ 3
}UU3 4
$strUU4 D
{UUD E
	startDateUUE N
:UUN O
$strUUO Y
}UUY Z
$strUUZ c
{UUc d
endDateUUd k
:UUk l
$strUUl v
}UUv w
"UUw x
)UUx y
;UUy z
ifWW 
(WW 
responseWW 
.WW 
IsSuccessStatusCodeWW ,
)WW, -
{XX 
returnYY 
awaitYY 
responseYY %
.YY% &
ContentYY& -
.ZZ 
ReadFromJsonAsyncZZ &
<ZZ& '
ListZZ' +
<ZZ+ ,!
DoctorScheduleItemDtoZZ, A
>ZZA B
>ZZB C
(ZZC D
)ZZD E
;ZZE F
}[[ 
var]] 
error]] 
=]] 
await]] 
response]] &
.]]& '
Content]]' .
.]]. /
ReadAsStringAsync]]/ @
(]]@ A
)]]A B
;]]B C
throw__ 
new__ 
	Exception__ 
(__  
$"`` 
$str`` .
{``. /
doctorId``/ 7
}``7 8
$str``8 Q
{``Q R
(``R S
int``S V
)``V W
response``W _
.``_ `

StatusCode``` j
}``j k
$str``k m
{``m n
error``n s
}``s t
"``t u
)``u v
;``v w
}aa 	
publiccc 
asynccc 
Taskcc 
<cc 
Listcc 
<cc !
DoctorScheduleItemDtocc 4
>cc4 5
?cc5 6
>cc6 7*
GetDoctorUpcomingScheduleAsynccc8 V
(ccV W
intccW Z
doctorIdcc[ c
)ccc d
{dd 	
varee 
responseee 
=ee 
awaitee  
_httpClientee! ,
.ee, -
GetAsyncee- 5
(ee5 6
$"ee6 8
$stree8 P
{eeP Q
doctorIdeeQ Y
}eeY Z
$streeZ c
"eec d
)eed e
;eee f
ifgg 
(gg 
responsegg 
.gg 
IsSuccessStatusCodegg ,
)gg, -
{hh 
returnii 
awaitii 
responseii %
.ii% &
Contentii& -
.jj 
ReadFromJsonAsyncjj &
<jj& '
Listjj' +
<jj+ ,!
DoctorScheduleItemDtojj, A
>jjA B
>jjB C
(jjC D
)jjD E
;jjE F
}kk 
varmm 
errormm 
=mm 
awaitmm 
responsemm &
.mm& '
Contentmm' .
.mm. /
ReadAsStringAsyncmm/ @
(mm@ A
)mmA B
;mmB C
throwoo 
newoo 
	Exceptionoo 
(oo  
$"pp 
$strpp .
{pp. /
doctorIdpp/ 7
}pp7 8
$strpp8 U
{ppU V
(ppV W
intppW Z
)ppZ [
responsepp[ c
.ppc d

StatusCodeppd n
}ppn o
$strppo q
{ppq r
errorppr w
}ppw x
"ppx y
)ppy z
;ppz {
}qq 	
publicss 
asyncss 
Taskss 
<ss 
AppointmentDtoss (
?ss( )
>ss) *
CreateAsyncss+ 6
(ss6 7 
CreateAppointmentDtoss7 K
dtossL O
)ssO P
{tt 	
varuu 
responseuu 
=uu 
awaituu  
_httpClientuu! ,
.uu, -
PostAsJsonAsyncuu- <
(uu< =
$struu= O
,uuO P
dtouuQ T
)uuT U
;uuU V
ifww 
(ww 
responseww 
.ww 
IsSuccessStatusCodeww ,
)ww, -
{xx 
returnyy 
awaityy 
responseyy %
.yy% &
Contentyy& -
.yy- .
ReadFromJsonAsyncyy. ?
<yy? @
AppointmentDtoyy@ N
>yyN O
(yyO P
)yyP Q
;yyQ R
}zz 
var|| 
error|| 
=|| 
await|| 
response|| &
.||& '
Content||' .
.||. /
ReadAsStringAsync||/ @
(||@ A
)||A B
;||B C
throw~~ 
new~~ 
	Exception~~ 
(~~  
$" 
$str ;
{; <
(< =
int= @
)@ A
responseA I
.I J

StatusCodeJ T
}T U
$strU W
{W X
errorX ]
}] ^
"^ _
)_ `
;` a
}
ÄÄ 	
public
ÇÇ 
async
ÇÇ 
Task
ÇÇ 
<
ÇÇ 
bool
ÇÇ 
>
ÇÇ 
UpdateAsync
ÇÇ  +
(
ÇÇ+ ,
int
ÇÇ, /
id
ÇÇ0 2
,
ÇÇ2 3"
UpdateAppointmentDto
ÇÇ4 H
dto
ÇÇI L
)
ÇÇL M
{
ÉÉ 	
var
ÑÑ 
response
ÑÑ 
=
ÑÑ 
await
ÑÑ  
_httpClient
ÑÑ! ,
.
ÑÑ, -
PutAsJsonAsync
ÑÑ- ;
(
ÑÑ; <
$"
ÑÑ< >
$str
ÑÑ> O
{
ÑÑO P
id
ÑÑP R
}
ÑÑR S
"
ÑÑS T
,
ÑÑT U
dto
ÑÑV Y
)
ÑÑY Z
;
ÑÑZ [
if
ÜÜ 
(
ÜÜ 
response
ÜÜ 
.
ÜÜ !
IsSuccessStatusCode
ÜÜ ,
)
ÜÜ, -
{
áá 
return
àà 
true
àà 
;
àà 
}
ââ 
var
ãã 
error
ãã 
=
ãã 
await
ãã 
response
ãã &
.
ãã& '
Content
ãã' .
.
ãã. /
ReadAsStringAsync
ãã/ @
(
ãã@ A
)
ããA B
;
ããB C
throw
çç 
new
çç 
	Exception
çç 
(
çç  
$"
éé 
$str
éé '
{
éé' (
id
éé( *
}
éé* +
$str
éé+ ?
{
éé? @
(
éé@ A
int
ééA D
)
ééD E
response
ééE M
.
ééM N

StatusCode
ééN X
}
ééX Y
$str
ééY [
{
éé[ \
error
éé\ a
}
ééa b
"
ééb c
)
ééc d
;
ééd e
}
èè 	
public
ëë 
async
ëë 
Task
ëë 
<
ëë 
bool
ëë 
>
ëë 
UpdateStatusAsync
ëë  1
(
ëë1 2
int
ëë2 5
id
ëë6 8
,
ëë8 9(
UpdateAppointmentStatusDto
ëë: T
dto
ëëU X
)
ëëX Y
{
íí 	
var
ìì 
response
ìì 
=
ìì 
await
ìì  
_httpClient
ìì! ,
.
ìì, -
PutAsJsonAsync
ìì- ;
(
ìì; <
$"
ìì< >
$str
ìì> O
{
ììO P
id
ììP R
}
ììR S
$str
ììS Z
"
ììZ [
,
ìì[ \
dto
ìì] `
)
ìì` a
;
ììa b
if
ïï 
(
ïï 
response
ïï 
.
ïï !
IsSuccessStatusCode
ïï ,
)
ïï, -
{
ññ 
return
óó 
true
óó 
;
óó 
}
òò 
var
öö 
error
öö 
=
öö 
await
öö 
response
öö &
.
öö& '
Content
öö' .
.
öö. /
ReadAsStringAsync
öö/ @
(
öö@ A
)
ööA B
;
ööB C
throw
úú 
new
úú 
	Exception
úú 
(
úú  
$"
ùù 
$str
ùù '
{
ùù' (
id
ùù( *
}
ùù* +
$str
ùù+ F
{
ùùF G
(
ùùG H
int
ùùH K
)
ùùK L
response
ùùL T
.
ùùT U

StatusCode
ùùU _
}
ùù_ `
$str
ùù` b
{
ùùb c
error
ùùc h
}
ùùh i
"
ùùi j
)
ùùj k
;
ùùk l
}
ûû 	
public
†† 
async
†† 
Task
†† 
<
†† 
bool
†† 
>
†† 
ConfirmAsync
††  ,
(
††, -
int
††- 0
id
††1 3
)
††3 4
{
°° 	
var
¢¢ 
response
¢¢ 
=
¢¢ 
await
¢¢  
_httpClient
¢¢! ,
.
¢¢, -
PutAsync
¢¢- 5
(
¢¢5 6
$"
¢¢6 8
$str
¢¢8 I
{
¢¢I J
id
¢¢J L
}
¢¢L M
$str
¢¢M U
"
¢¢U V
,
¢¢V W
null
¢¢X \
)
¢¢\ ]
;
¢¢] ^
if
§§ 
(
§§ 
response
§§ 
.
§§ !
IsSuccessStatusCode
§§ ,
)
§§, -
{
•• 
return
¶¶ 
true
¶¶ 
;
¶¶ 
}
ßß 
var
©© 
error
©© 
=
©© 
await
©© 
response
©© &
.
©©& '
Content
©©' .
.
©©. /
ReadAsStringAsync
©©/ @
(
©©@ A
)
©©A B
;
©©B C
throw
´´ 
new
´´ 
	Exception
´´ 
(
´´  
$"
¨¨ 
$str
¨¨ '
{
¨¨' (
id
¨¨( *
}
¨¨* +
$str
¨¨+ G
{
¨¨G H
(
¨¨H I
int
¨¨I L
)
¨¨L M
response
¨¨M U
.
¨¨U V

StatusCode
¨¨V `
}
¨¨` a
$str
¨¨a c
{
¨¨c d
error
¨¨d i
}
¨¨i j
"
¨¨j k
)
¨¨k l
;
¨¨l m
}
≠≠ 	
public
ØØ 
async
ØØ 
Task
ØØ 
<
ØØ 
bool
ØØ 
>
ØØ 
CompleteAsync
ØØ  -
(
ØØ- .
int
ØØ. 1
id
ØØ2 4
)
ØØ4 5
{
∞∞ 	
var
±± 
response
±± 
=
±± 
await
±±  
_httpClient
±±! ,
.
±±, -
PutAsync
±±- 5
(
±±5 6
$"
±±6 8
$str
±±8 I
{
±±I J
id
±±J L
}
±±L M
$str
±±M V
"
±±V W
,
±±W X
null
±±Y ]
)
±±] ^
;
±±^ _
if
≥≥ 
(
≥≥ 
response
≥≥ 
.
≥≥ !
IsSuccessStatusCode
≥≥ ,
)
≥≥, -
{
¥¥ 
return
µµ 
true
µµ 
;
µµ 
}
∂∂ 
var
∏∏ 
error
∏∏ 
=
∏∏ 
await
∏∏ 
response
∏∏ &
.
∏∏& '
Content
∏∏' .
.
∏∏. /
ReadAsStringAsync
∏∏/ @
(
∏∏@ A
)
∏∏A B
;
∏∏B C
throw
∫∫ 
new
∫∫ 
	Exception
∫∫ 
(
∫∫  
$"
ªª 
$str
ªª '
{
ªª' (
id
ªª( *
}
ªª* +
$str
ªª+ H
{
ªªH I
(
ªªI J
int
ªªJ M
)
ªªM N
response
ªªN V
.
ªªV W

StatusCode
ªªW a
}
ªªa b
$str
ªªb d
{
ªªd e
error
ªªe j
}
ªªj k
"
ªªk l
)
ªªl m
;
ªªm n
}
ºº 	
public
ææ 
async
ææ 
Task
ææ 
<
ææ 
bool
ææ 
>
ææ 
CancelAsync
ææ  +
(
ææ+ ,
int
ææ, /
id
ææ0 2
,
ææ2 3"
CancelAppointmentDto
ææ4 H
dto
ææI L
)
ææL M
{
øø 	
var
¿¿ 
response
¿¿ 
=
¿¿ 
await
¿¿  
_httpClient
¿¿! ,
.
¿¿, -
PutAsJsonAsync
¿¿- ;
(
¿¿; <
$"
¿¿< >
$str
¿¿> O
{
¿¿O P
id
¿¿P R
}
¿¿R S
$str
¿¿S Z
"
¿¿Z [
,
¿¿[ \
dto
¿¿] `
)
¿¿` a
;
¿¿a b
if
¬¬ 
(
¬¬ 
response
¬¬ 
.
¬¬ !
IsSuccessStatusCode
¬¬ ,
)
¬¬, -
{
√√ 
return
ƒƒ 
true
ƒƒ 
;
ƒƒ 
}
≈≈ 
var
«« 
error
«« 
=
«« 
await
«« 
response
«« &
.
««& '
Content
««' .
.
««. /
ReadAsStringAsync
««/ @
(
««@ A
)
««A B
;
««B C
throw
…… 
new
…… 
	Exception
…… 
(
……  
$"
   
$str
   '
{
  ' (
id
  ( *
}
  * +
$str
  + F
{
  F G
(
  G H
int
  H K
)
  K L
response
  L T
.
  T U

StatusCode
  U _
}
  _ `
$str
  ` b
{
  b c
error
  c h
}
  h i
"
  i j
)
  j k
;
  k l
}
ÀÀ 	
}
ÃÃ 
}ÕÕ Å
jC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxis.Blazor\Services\Implementation\AdminService.cs
	namespace 	
S4_HealthAxis
 
. 
Blazor 
. 
Services '
{ 
public 

class 
AdminService 
: 
IAdminService  -
{ 
private		 
readonly		 

HttpClient		 #
_httpClient		$ /
;		/ 0
public 
AdminService 
( 

HttpClient &

httpClient' 1
)1 2
{ 	
_httpClient 
= 

httpClient $
;$ %
} 	
public 
async 
Task 
< 
DashboardDto &
?& '
>' (
GetDashboardAsync) :
(: ;
); <
{ 	
return 
await 
_httpClient $
.$ %
GetFromJsonAsync% 5
<5 6
DashboardDto6 B
>B C
(C D
$strD Y
)Y Z
;Z [
} 	
public 
async 
Task 
< 
StatisticsDto '
?' (
>( )
GetStatisticsAsync* <
(< =
)= >
{ 	
return 
await 
_httpClient $
.$ %
GetFromJsonAsync% 5
<5 6
StatisticsDto6 C
>C D
(D E
$strE [
)[ \
;\ ]
} 	
public 
async 
Task 
< 
List 
< 
UserManagementDto 0
>0 1
?1 2
>2 3
GetUsersAsync4 A
(A B
)B C
{ 	
return 
await 
_httpClient $
.$ %
GetFromJsonAsync% 5
<5 6
List6 :
<: ;
UserManagementDto; L
>L M
>M N
(N O
$strO `
)` a
;a b
} 	
} 
} π#
fC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxis.Blazor\Services\CustomAuthStateProvider.cs
	namespace 	
S4_HealthAxis
 
. 
Blazor 
. 
Services '
{ 
public 

class #
CustomAuthStateProvider (
:) *'
AuthenticationStateProvider+ F
{ 
private		 
readonly		 

IJSRuntime		 #

_jsRuntime		$ .
;		. /
public #
CustomAuthStateProvider &
(& '

IJSRuntime' 1
	jsRuntime2 ;
); <
{ 	

_jsRuntime 
= 
	jsRuntime "
;" #
} 	
public 
override 
async 
Task "
<" #
AuthenticationState# 6
>6 7'
GetAuthenticationStateAsync8 S
(S T
)T U
{ 	
try 
{ 
var 
token 
= 
await !

_jsRuntime" ,
., -
InvokeAsync- 8
<8 9
string9 ?
>? @
(@ A
$strA W
,W X
$strY d
)d e
;e f
if 
( 
string 
. 
IsNullOrWhiteSpace -
(- .
token. 3
)3 4
)4 5
{ 
return 
new 
AuthenticationState 2
(2 3
new3 6
ClaimsPrincipal7 F
(F G
newG J
ClaimsIdentityK Y
(Y Z
)Z [
)[ \
)\ ]
;] ^
} 
var 
claims 
= 
	JwtParser &
.& '
ParseClaimsFromJwt' 9
(9 :
token: ?
)? @
;@ A
var 
identity 
= 
new "
ClaimsIdentity# 1
(1 2
claims2 8
,8 9
$str: ?
)? @
;@ A
var 
user 
= 
new 
ClaimsPrincipal .
(. /
identity/ 7
)7 8
;8 9
return   
new   
AuthenticationState   .
(  . /
user  / 3
)  3 4
;  4 5
}!! 
catch"" 
{## 
return$$ 
new$$ 
AuthenticationState$$ .
($$. /
new$$/ 2
ClaimsPrincipal$$3 B
($$B C
new$$C F
ClaimsIdentity$$G U
($$U V
)$$V W
)$$W X
)$$X Y
;$$Y Z
}%% 
}&& 	
public(( 
void(( $
NotifyUserAuthentication(( ,
(((, -
string((- 3
token((4 9
)((9 :
{)) 	
var** 
claims** 
=** 
	JwtParser** "
.**" #
ParseClaimsFromJwt**# 5
(**5 6
token**6 ;
)**; <
;**< =
var++ 
authenticatedUser++ !
=++" #
new++$ '
ClaimsPrincipal++( 7
(++7 8
new++8 ;
ClaimsIdentity++< J
(++J K
claims++K Q
,++Q R
$str++S X
)++X Y
)++Y Z
;++Z [
var,, 
	authState,, 
=,, 
Task,,  
.,,  !

FromResult,,! +
(,,+ ,
new,,, /
AuthenticationState,,0 C
(,,C D
authenticatedUser,,D U
),,U V
),,V W
;,,W X,
 NotifyAuthenticationStateChanged-- ,
(--, -
	authState--- 6
)--6 7
;--7 8
}.. 	
public00 
void00 
NotifyUserLogout00 $
(00$ %
)00% &
{11 	
var22 
anonymousUser22 
=22 
new22  #
ClaimsPrincipal22$ 3
(223 4
new224 7
ClaimsIdentity228 F
(22F G
)22G H
)22H I
;22I J
var33 
	authState33 
=33 
Task33  
.33  !

FromResult33! +
(33+ ,
new33, /
AuthenticationState330 C
(33C D
anonymousUser33D Q
)33Q R
)33R S
;33S T,
 NotifyAuthenticationStateChanged44 ,
(44, -
	authState44- 6
)446 7
;447 8
}55 	
}66 
}77 Ò-
MC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxis.Blazor\Program.cs
var 
builder 
= "
WebAssemblyHostBuilder $
.$ %
CreateDefault% 2
(2 3
args3 7
)7 8
;8 9
builder		 
.		 
RootComponents		 
.		 
Add		 
<		 
App		 
>		 
(		  
$str		  &
)		& '
;		' (
builder

 
.

 
RootComponents

 
.

 
Add

 
<

 

HeadOutlet

 %
>

% &
(

& '
$str

' 4
)

4 5
;

5 6
builder 
. 
Services 
.  
AddAuthorizationCore %
(% &
)& '
;' (
builder 
. 
Services 
. 
	AddScoped 
< '
AuthenticationStateProvider 6
,6 7#
CustomAuthStateProvider8 O
>O P
(P Q
)Q R
;R S
builder 
. 
Services 
. 
AddTransient 
< &
TokenAuthenticationHandler 8
>8 9
(9 :
): ;
;; <
builder 
. 
Services 
. 
	AddScoped 
( 
sp 
=>  
new! $

HttpClient% /
{ 
BaseAddress 
= 
new 
Uri 
( 
$str 3
)3 4
} 
) 
; 
builder 
. 
Services 
. 
AddHttpClient 
( 
$str .
,. /
client0 6
=>7 9
{ 
client 

.
 
BaseAddress 
= 
new 
Uri  
(  !
$str! :
): ;
;; <
} 
) 
. !
AddHttpMessageHandler 
< &
TokenAuthenticationHandler 1
>1 2
(2 3
)3 4
;4 5
builder 
. 
Services 
. 
	AddScoped 
< 
IAuthService '
,' (
AuthService) 4
>4 5
(5 6
)6 7
;7 8
builder 
. 
Services 
. 
	AddScoped 
< 
IAdminService (
>( )
() *
sp* ,
=>- /
{ 
var   
httpClientFactory   
=   
sp   
.   
GetRequiredService   1
<  1 2
IHttpClientFactory  2 D
>  D E
(  E F
)  F G
;  G H
var!! 
client!! 
=!! 
httpClientFactory!! "
.!!" #
CreateClient!!# /
(!!/ 0
$str!!0 ?
)!!? @
;!!@ A
return## 

new## 
AdminService## 
(## 
client## "
)##" #
;### $
}$$ 
)$$ 
;$$ 
builder&& 
.&& 
Services&& 
.&& 
	AddScoped&& 
<&& 
IDoctorService&& )
>&&) *
(&&* +
sp&&+ -
=>&&. 0
{'' 
var(( 
httpClientFactory(( 
=(( 
sp(( 
.(( 
GetRequiredService(( 1
<((1 2
IHttpClientFactory((2 D
>((D E
(((E F
)((F G
;((G H
var)) 
client)) 
=)) 
httpClientFactory)) "
.))" #
CreateClient))# /
())/ 0
$str))0 ?
)))? @
;))@ A
return++ 

new++ 
DoctorService++ 
(++ 
client++ #
)++# $
;++$ %
},, 
),, 
;,, 
builder.. 
... 
Services.. 
... 
	AddScoped.. 
<.. 
IPatientService.. *
>..* +
(..+ ,
sp.., .
=>../ 1
{// 
var00 
httpClientFactory00 
=00 
sp00 
.00 
GetRequiredService00 1
<001 2
IHttpClientFactory002 D
>00D E
(00E F
)00F G
;00G H
var11 
client11 
=11 
httpClientFactory11 "
.11" #
CreateClient11# /
(11/ 0
$str110 ?
)11? @
;11@ A
return33 

new33 
PatientService33 
(33 
client33 $
)33$ %
;33% &
}44 
)44 
;44 
builder66 
.66 
Services66 
.66 
	AddScoped66 
<66 
IAppointmentService66 .
>66. /
(66/ 0
sp660 2
=>663 5
{77 
var88 
httpClientFactory88 
=88 
sp88 
.88 
GetRequiredService88 1
<881 2
IHttpClientFactory882 D
>88D E
(88E F
)88F G
;88G H
var99 
client99 
=99 
httpClientFactory99 "
.99" #
CreateClient99# /
(99/ 0
$str990 ?
)99? @
;99@ A
return;; 

new;; 
AppointmentService;; !
(;;! "
client;;" (
);;( )
;;;) *
}<< 
)<< 
;<< 
await>> 
builder>> 
.>> 
Build>> 
(>> 
)>> 
.>> 
RunAsync>> 
(>> 
)>>  
;>>  !—
TC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxis.Blazor\Models\UserDto.cs
	namespace 	
S4_HealthAxis
 
. 
Blazor 
. 
Models %
{ 
public 

class 
UserDto 
{ 
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public		 
string		 
Role		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
=		) *
string		+ 1
.		1 2
Empty		2 7
;		7 8
public 
DateTime 
CreatedDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} ‚
ZC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxis.Blazor\Models\StatisticsDto.cs
	namespace 	
S4_HealthAxis
 
. 
Blazor 
. 
Models %
{ 
public 

class 
StatisticsDto 
{ 
public 
int !
CompletedAppointments (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
int 
PendingAppointments &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public		 
int		 !
ConfirmedAppointments		 (
{		) *
get		+ .
;		. /
set		0 3
;		3 4
}		5 6
public 
int !
CancelledAppointments (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
} 
} Ç
WC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxis.Blazor\Models\PatientDto.cs
	namespace 	
S4_HealthAxis
 
. 
Blazor 
. 
Models %
{ 
public 

class 

PatientDto 
{ 
public 
int 
	PatientId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
FullName 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
public		 
DateOnly		 
DateOfBirth		 #
{		$ %
get		& )
;		) *
set		+ .
;		. /
}		0 1
public 
int 
Gender 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
PhoneNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
string2 8
.8 9
Empty9 >
;> ?
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public 
bool 
IsActive 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} ß
YC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxis.Blazor\Models\LoginRequest.cs
	namespace 	
S4_HealthAxis
 
. 
Blazor 
. 
Models %
{ 
public 

class 
LoginRequest 
{ 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
} 
}		 π
VC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxis.Blazor\Models\DoctorDto.cs
	namespace 	
S4_HealthAxis
 
. 
Blazor 
. 
Models %
{ 
public 

class 
	DoctorDto 
{ 
public 
int 
DoctorId 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
FullName 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
public		 
string		 
Email		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
=		* +
string		, 2
.		2 3
Empty		3 8
;		8 9
public 
int 
Specialisation !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
int 
YearsOfExperience $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
decimal 
ConsultationFee &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
bool 
IsActive 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} Ÿ
aC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxis.Blazor\Models\DoctorCreationResult.cs
	namespace 	
S4_HealthAxis
 
. 
Blazor 
. 
Models %
{ 
public 

class  
DoctorCreationResult %
{ 
public 
int 
DoctorId 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public		 
string		 
TemporaryPassword		 '
{		( )
get		* -
;		- .
set		/ 2
;		2 3
}		4 5
=		6 7
string		8 >
.		> ?
Empty		? D
;		D E
}

 
} Æ
YC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxis.Blazor\Models\DashboardDto.cs
	namespace 	
S4_HealthAxis
 
. 
Blazor 
. 
Models %
{ 
public 

class 
DashboardDto 
{ 
public 
int 
TotalDoctors 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
ActiveDoctors  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
int 
TotalPatients  
{! "
get# &
;& '
set( +
;+ ,
}- .
public		 
int		 
ActivePatients		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
public 
int 
TodayAppointments $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
int 
PendingAppointments &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
int !
CompletedAppointments (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
} 
} ö

`C:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxis.Blazor\Models\CreateDoctorRequest.cs
	namespace 	
S4_HealthAxis
 
. 
Blazor 
. 
Models %
{ 
public 

class 
CreateDoctorRequest $
{ 
public 
string 
FullName 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public		 
int		 
Specialisation		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
public 
int 
YearsOfExperience $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
decimal 
ConsultationFee &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
} 
} ä

YC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxis.Blazor\Models\AuthResponse.cs
	namespace 	
S4_HealthAxis
 
. 
Blazor 
. 
Models %
{ 
public 

class 
AuthResponse 
{ 
public 
string 
AccessToken !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
string2 8
.8 9
Empty9 >
;> ?
public 
string 
RefreshToken "
{# $
get% (
;( )
set* -
;- .
}/ 0
=1 2
string3 9
.9 :
Empty: ?
;? @
public		 
string		 
Email		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
=		* +
string		, 2
.		2 3
Empty		3 8
;		8 9
public 
string 
Role 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string+ 1
.1 2
Empty2 7
;7 8
} 
} ß
[C:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxis.Blazor\Models\AppointmentDto.cs
	namespace 	
S4_HealthAxis
 
. 
Blazor 
. 
Models %
{ 
public 

class 
AppointmentDto 
{ 
public 
int 
AppointmentId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
int 
	PatientId 
{ 
get "
;" #
set$ '
;' (
}) *
public		 
int		 
DoctorId		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
public 
DateOnly 
ScheduledDate %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
int 
TimeSlot 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
Status 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
? 
CancellationReason )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 
} 