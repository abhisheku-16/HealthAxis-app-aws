˘	
aC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Services\Interface\IUserService.cs
	namespace 	
S4_HealthAxisApi
 
. 
Services #
.# $
	Interface$ -
{ 
public 

	interface 
IUserService !
{ 
Task 
< 
User 
? 
> 
GetByEmailAsync #
(# $
string$ *
email+ 0
)0 1
;1 2
Task		 
<		 
User		 
?		 
>		 "
GetByRefreshTokenAsync		 *
(		* +
string		+ 1
refreshToken		2 >
)		> ?
;		? @
Task 
< 
bool 
> 
EmailExistsAsync #
(# $
string$ *
email+ 0
)0 1
;1 2
Task 
CreateAsync 
( 
User 
user "
)" #
;# $
Task 
UpdateAsync 
( 
User 
user "
)" #
;# $
Task 
SaveChangesAsync 
( 
) 
;  
} 
} —
dC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Services\Interface\IPatientService.cs
	namespace 	
S4_HealthAxisApi
 
. 
Services #
.# $
	Interface$ -
{ 
public 

	interface 
IPatientService $
{ 
Task 
< 
IEnumerable 
< 

PatientDto #
># $
>$ %
GetAllAsync& 1
(1 2
)2 3
;3 4
Task		 
<		 

PatientDto		 
?		 
>		 
GetByIdAsync		 &
(		& '
int		' *
id		+ -
)		- .
;		. /
Task 
< 
IEnumerable 
< "
PatientSearchResultDto /
>/ 0
>0 1
SearchByNameAsync2 C
(C D
stringD J
nameK O
)O P
;P Q
Task 
< 

PatientDto 
> 
CreateAsync $
($ %
CreatePatientDto% 5
dto6 9
)9 :
;: ;
Task 
UpdateAsync 
( 
int 
id 
,  
UpdatePatientDto! 1
dto2 5
)5 6
;6 7
Task 
DeactivateAsync 
( 
int  
id! #
)# $
;$ %
Task 
ActivateAsync 
( 
int 
id !
)! "
;" #
} 
} â
iC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Services\Interface\IHealthRecordService.cs
	namespace 	
S4_HealthAxisApi
 
. 
Services #
.# $
	Interface$ -
{ 
public 

	interface  
IHealthRecordService )
{ 
Task 
< 
HealthRecordDto 
? 
> 
GetByIdAsync +
(+ ,
int, /
id0 2
)2 3
;3 4
Task		 
<		 
HealthRecordDto		 
?		 
>		 #
GetByAppointmentIdAsync		 6
(		6 7
int		7 :
appointmentId		; H
)		H I
;		I J
Task 
< 
IEnumerable 
< 
HealthRecordDto (
>( )
>) *
GetByPatientIdAsync+ >
(> ?
int? B
	patientIdC L
)L M
;M N
Task 
< 
HealthRecordDto 
> 
CreateAsync )
() *!
CreateHealthRecordDto* ?
dto@ C
)C D
;D E
Task 
UpdateAsync 
( 
int 
id 
,  !
UpdateHealthRecordDto! 6
dto7 :
): ;
;; <
} 
} “
cC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Services\Interface\IDoctorService.cs
	namespace 	
S4_HealthAxisApi
 
. 
Services #
.# $
	Interface$ -
{ 
public 

	interface 
IDoctorService #
{ 
Task 
< 
IEnumerable 
< 
	DoctorDto "
>" #
># $
GetAllAsync% 0
(0 1
string1 7
?7 8
sortBy9 ?
,? @
intA D
?D E
specialisationF T
)T U
;U V
Task		 
<		 
IEnumerable		 
<		 
	DoctorDto		 "
>		" #
>		# $*
GetActiveBySpecialisationAsync		% C
(		C D
int		D G
specialisation		H V
)		V W
;		W X
Task 
< 
	DoctorDto 
? 
> 
GetByIdAsync %
(% &
int& )
id* ,
), -
;- .
Task 
< 
	DoctorDto 
> 
CreateAsync #
(# $
CreateDoctorDto$ 3
dto4 7
)7 8
;8 9
Task 
UpdateAsync 
( 
int 
id 
,  
UpdateDoctorDto! 0
dto1 4
)4 5
;5 6
Task 
< 
IEnumerable 
< 
int 
> 
>  
GetAvailabilityAsync 3
(3 4
int4 7
doctorId8 @
,@ A
DateOnlyB J
dateK O
)O P
;P Q
Task 
< #
DoctorCreationResultDto $
>$ %(
CreateDoctorWithAccountAsync& B
(B C
CreateDoctorDtoC R
dtoS V
)V W
;W X
Task 
ActivateAsync 
( 
int 
id !
)! "
;" #
Task 
DeactivateAsync 
( 
int  
id! #
)# $
;$ %
} 
} ì
aC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Services\Interface\IAuthService.cs
	namespace 	
S4_HealthAxisApi
 
. 
Services #
.# $
	Interface$ -
{ 
public 

	interface 
IAuthService !
{ 
Task 
< 
( 
bool 
Success 
, 
string "
Message# *
,* +
AuthResponseDto, ;
?; <
Data= A
)A B
>B C
RegisterAsyncD Q
(Q R
RegisterDtoR ]
request^ e
)e f
;f g
Task		 
<		 
(		 
bool		 
Success		 
,		 
string		 "
Message		# *
,		* +
AuthResponseDto		, ;
?		; <
Data		= A
)		A B
>		B C 
RegisterPatientAsync		D X
(		X Y
RegisterPatientDto		Y k
request		l s
)		s t
;		t u
Task 
< 
( 
bool 
Success 
, 
string "
Message# *
,* +
AuthResponseDto, ;
?; <
Data= A
)A B
>B C

LoginAsyncD N
(N O
LoginDtoO W
requestX _
)_ `
;` a
Task 
< 
( 
bool 
Success 
, 
string "
Message# *
,* +
AuthResponseDto, ;
?; <
Data= A
)A B
>B C
RefreshTokenAsyncD U
(U V
RefreshTokenDtoV e
requestf m
)m n
;n o
Task 
< 
( 
bool 
Success 
, 
string "
Message# *
)* +
>+ ,
ChangePasswordAsync- @
(@ A
stringA G
emailH M
,M N
ChangePasswordDtoO `
requesta h
)h i
;i j
} 
} ë
hC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Services\Interface\IAppointmentService.cs
	namespace 	
S4_HealthAxisApi
 
. 
Services #
.# $
	Interface$ -
{ 
public 

	interface 
IAppointmentService (
{ 
Task 
< 
IEnumerable 
< !
AppointmentDetailsDto .
>. /
>/ 0
GetAllAsync1 <
(< =
)= >
;> ?
Task

 
<

 !
AppointmentDetailsDto

 "
?

" #
>

# $
GetByIdAsync

% 1
(

1 2
int

2 5
id

6 8
)

8 9
;

9 :
Task 
< 
IEnumerable 
< (
PatientAppointmentHistoryDto 5
>5 6
>6 7"
GetPatientHistoryAsync8 N
(N O
intO R
	patientIdS \
)\ ]
;] ^
Task 
< 
IEnumerable 
< !
DoctorScheduleItemDto .
>. /
>/ 0'
GetDoctorTodayScheduleAsync1 L
(L M
intM P
doctorIdQ Y
)Y Z
;Z [
Task 
< 
IEnumerable 
< !
DoctorScheduleItemDto .
>. /
>/ 0&
GetDoctorWeekScheduleAsync1 K
(K L
int 
doctorId 
, 
DateOnly 
	startDate 
, 
DateOnly 
endDate 
) 
; 
Task 
< 
AppointmentDto 
> 
CreateAsync (
(( ) 
CreateAppointmentDto) =
dto> A
)A B
;B C
Task 
< 
IEnumerable 
< !
DoctorScheduleItemDto .
>. /
>/ 0*
GetDoctorUpcomingScheduleAsync1 O
(O P
intP S
doctorIdT \
)\ ]
;] ^
Task 
< 
IEnumerable 
< 
DoctorPatientDto )
>) *
>* +"
GetDoctorPatientsAsync, B
(B C
intC F
doctorIdG O
)O P
;P Q
Task 
UpdateAsync 
( 
int 
id 
,   
UpdateAppointmentDto! 5
dto6 9
)9 :
;: ;
Task 
UpdateStatusAsync 
( 
int "
id# %
,% &&
UpdateAppointmentStatusDto' A
dtoB E
)E F
;F G
Task 
ConfirmAsync 
( 
int 
id  
)  !
;! "
Task 
CompleteAsync 
( 
int 
id !
)! "
;" #
Task!! 
CancelAsync!! 
(!! 
int!! 
id!! 
,!!   
CancelAppointmentDto!!! 5
dto!!6 9
)!!9 :
;!!: ;
}"" 
}## ∞
bC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Services\Interface\IAdminService.cs
	namespace 	
S4_HealthAxisApi
 
. 
Services #
.# $
	Interface$ -
{ 
public 

	interface 
IAdminService "
{ 
Task 
< 
AdminDashboardDto 
> 
GetDashboardAsync  1
(1 2
)2 3
;3 4
Task		 
<		 
AdminStatisticsDto		 
>		  
GetStatisticsAsync		! 3
(		3 4
)		4 5
;		5 6
Task 
< 
IEnumerable 
< 
UserManagementDto *
>* +
>+ ,
GetUsersAsync- :
(: ;
); <
;< =
Task 
< 
UserManagementDto 
? 
>  
GetUserByIdAsync! 1
(1 2
int2 5
id6 8
)8 9
;9 :
} 
} ´
eC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Services\Implementation\UserService.cs
	namespace 	
S4_HealthAxisApi
 
. 
Services #
.# $
Implementation$ 2
{ 
public 

class 
UserService 
: 
IUserService +
{ 
private		 
readonly		 
IUserRepository		 (
_userRepository		) 8
;		8 9
public 
UserService 
( 
IUserRepository 
userRepository *
)* +
{ 	
_userRepository 
= 
userRepository ,
;, -
} 	
public 
async 
Task 
< 
User 
? 
>  
GetByEmailAsync! 0
(0 1
string 
email 
) 
{ 	
return 
await 
_userRepository (
. 
GetByEmailAsync  
(  !
email! &
)& '
;' (
} 	
public 
async 
Task 
< 
User 
? 
>  "
GetByRefreshTokenAsync! 7
(7 8
string 
refreshToken 
)  
{ 	
return 
await 
_userRepository (
. "
GetByRefreshTokenAsync '
(' (
refreshToken( 4
)4 5
;5 6
} 	
public 
async 
Task 
< 
bool 
> 
EmailExistsAsync  0
(0 1
string   
email   
)   
{!! 	
return"" 
await"" 
_userRepository"" (
.## 
EmailExistsAsync## !
(##! "
email##" '
)##' (
;##( )
}$$ 	
public&& 
async&& 
Task&& 
CreateAsync&& %
(&&% &
User'' 
user'' 
)'' 
{(( 	
await)) 
_userRepository)) !
.** 
AddAsync** 
(** 
user** 
)** 
;**  
}++ 	
public-- 
async-- 
Task-- 
UpdateAsync-- %
(--% &
User.. 
user.. 
).. 
{// 	
await00 
_userRepository00 !
.11 
UpdateAsync11 
(11 
user11 !
)11! "
;11" #
}22 	
public44 
async44 
Task44 
SaveChangesAsync44 *
(44* +
)44+ ,
{55 	
await66 
_userRepository66 !
.77 
SaveChangesAsync77 !
(77! "
)77" #
;77# $
}88 	
}99 
}:: ±r
hC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Services\Implementation\PatientService.cs
	namespace 	
S4_HealthAxisApi
 
. 
Services #
.# $
Implementation$ 2
{ 
public 

class 
PatientService 
:  !
IPatientService" 1
{		 
private

 
readonly

 
IPatientRepository

 +
_patientRepository

, >
;

> ?
public 
PatientService 
( 
IPatientRepository 0
patientRepository1 B
)B C
{ 	
_patientRepository 
=  
patientRepository! 2
;2 3
} 	
public 
async 
Task 
< 
IEnumerable %
<% &

PatientDto& 0
>0 1
>1 2
GetAllAsync3 >
(> ?
)? @
{ 	
var 
patients 
= 
await  
_patientRepository! 3
.3 4
GetAllAsync4 ?
(? @
)@ A
;A B
return 
patients 
. 
Select "
(" #
MapToPatientDto# 2
)2 3
;3 4
} 	
public 
async 
Task 
< 

PatientDto $
?$ %
>% &
GetByIdAsync' 3
(3 4
int4 7
id8 :
): ;
{ 	
var 
patient 
= 
await 
_patientRepository  2
.2 3
GetByIdAsync3 ?
(? @
id@ B
)B C
;C D
return 
patient 
== 
null "
? 
null 
: 
MapToPatientDto !
(! "
patient" )
)) *
;* +
} 	
public!! 
async!! 
Task!! 
<!! 
IEnumerable!! %
<!!% &"
PatientSearchResultDto!!& <
>!!< =
>!!= >
SearchByNameAsync!!? P
(!!P Q
string!!Q W
name!!X \
)!!\ ]
{"" 	
var## 
patients## 
=## 
await##  
_patientRepository##! 3
.##3 4
SearchByNameAsync##4 E
(##E F
name##F J
)##J K
;##K L
return%% 
patients%% 
.%% 
Select%% "
(%%" #
p%%# $
=>%%% '
new%%( +"
PatientSearchResultDto%%, B
{&& 
	PatientId'' 
='' 
p'' 
.'' 
	PatientId'' '
,''' (
FullName(( 
=(( 
p(( 
.(( 
FullName(( %
,((% &
IsActive)) 
=)) 
p)) 
.)) 
IsActive)) %
}** 
)** 
;** 
}++ 	
public-- 
async-- 
Task-- 
<-- 

PatientDto-- $
>--$ %
CreateAsync--& 1
(--1 2
CreatePatientDto--2 B
dto--C F
)--F G
{.. 	
ValidatePatient// 
(// 
dto// 
)//  
;//  !
var11 
patient11 
=11 
new11 
Patient11 %
{22 
FullName33 
=33 
dto33 
.33 
FullName33 '
.33' (
Trim33( ,
(33, -
)33- .
,33. /
DateOfBirth44 
=44 
dto44 !
.44! "
DateOfBirth44" -
,44- .
Gender55 
=55 
dto55 
.55 
Gender55 #
,55# $
PhoneNumber66 
=66 
dto66 !
.66! "
PhoneNumber66" -
.66- .
Trim66. 2
(662 3
)663 4
,664 5
Email77 
=77 
dto77 
.77 
Email77 !
?77! "
.77" #
Trim77# '
(77' (
)77( )
??77) +
String77+ 1
.771 2
Empty772 7
,777 8
InsuranceNumber88 
=88  !
dto88" %
.88% &
InsuranceNumber88& 5
?885 6
.886 7
Trim887 ;
(88; <
)88< =
,88= >
IsActive99 
=99 
true99 
}:: 
;:: 
await<< 
_patientRepository<< $
.<<$ %
AddAsync<<% -
(<<- .
patient<<. 5
)<<5 6
;<<6 7
await== 
_patientRepository== $
.==$ %
SaveChangesAsync==% 5
(==5 6
)==6 7
;==7 8
return?? 
MapToPatientDto?? "
(??" #
patient??# *
)??* +
;??+ ,
}@@ 	
publicBB 
asyncBB 
TaskBB 
UpdateAsyncBB %
(BB% &
intBB& )
idBB* ,
,BB, -
UpdatePatientDtoBB. >
dtoBB? B
)BBB C
{CC 	
ValidatePatientDD 
(DD 
dtoDD 
)DD  
;DD  !
varFF 
patientFF 
=FF 
awaitFF 
_patientRepositoryFF  2
.FF2 3
GetByIdAsyncFF3 ?
(FF? @
idFF@ B
)FFB C
;FFC D
ifHH 
(HH 
patientHH 
==HH 
nullHH 
)HH  
throwII 
newII  
KeyNotFoundExceptionII .
(II. /
$"II/ 1
$strII1 A
{IIA B
idIIB D
}IID E
$strIIE P
"IIP Q
)IIQ R
;IIR S
patientKK 
.KK 
FullNameKK 
=KK 
dtoKK "
.KK" #
FullNameKK# +
.KK+ ,
TrimKK, 0
(KK0 1
)KK1 2
;KK2 3
patientLL 
.LL 
DateOfBirthLL 
=LL  !
dtoLL" %
.LL% &
DateOfBirthLL& 1
;LL1 2
patientMM 
.MM 
GenderMM 
=MM 
dtoMM  
.MM  !
GenderMM! '
;MM' (
patientNN 
.NN 
PhoneNumberNN 
=NN  !
dtoNN" %
.NN% &
PhoneNumberNN& 1
.NN1 2
TrimNN2 6
(NN6 7
)NN7 8
;NN8 9
patientOO 
.OO 
EmailOO 
=OO 
dtoOO 
.OO  
EmailOO  %
?OO% &
.OO& '
TrimOO' +
(OO+ ,
)OO, -
??OO. 0
StringOO1 7
.OO7 8
EmptyOO8 =
;OO= >
patientPP 
.PP 
InsuranceNumberPP #
=PP$ %
dtoPP& )
.PP) *
InsuranceNumberPP* 9
?PP9 :
.PP: ;
TrimPP; ?
(PP? @
)PP@ A
;PPA B
awaitRR 
_patientRepositoryRR $
.RR$ %
UpdateAsyncRR% 0
(RR0 1
patientRR1 8
)RR8 9
;RR9 :
awaitSS 
_patientRepositorySS $
.SS$ %
SaveChangesAsyncSS% 5
(SS5 6
)SS6 7
;SS7 8
}TT 	
publicVV 
asyncVV 
TaskVV 
DeactivateAsyncVV )
(VV) *
intVV* -
idVV. 0
)VV0 1
{WW 	
varXX 
patientXX 
=XX 
awaitXX 
_patientRepositoryXX  2
.XX2 3
GetByIdAsyncXX3 ?
(XX? @
idXX@ B
)XXB C
;XXC D
ifZZ 
(ZZ 
patientZZ 
==ZZ 
nullZZ 
)ZZ  
throw[[ 
new[[  
KeyNotFoundException[[ .
([[. /
$"[[/ 1
$str[[1 A
{[[A B
id[[B D
}[[D E
$str[[E P
"[[P Q
)[[Q R
;[[R S
patient]] 
.]] 
IsActive]] 
=]] 
false]] $
;]]$ %
await__ 
_patientRepository__ $
.__$ %
UpdateAsync__% 0
(__0 1
patient__1 8
)__8 9
;__9 :
await`` 
_patientRepository`` $
.``$ %
SaveChangesAsync``% 5
(``5 6
)``6 7
;``7 8
}aa 	
publiccc 
asynccc 
Taskcc 
ActivateAsynccc '
(cc' (
intcc( +
idcc, .
)cc. /
{dd 	
varee 
patientee 
=ee 
awaitee 
_patientRepositoryee  2
.ee2 3
GetByIdAsyncee3 ?
(ee? @
idee@ B
)eeB C
;eeC D
ifgg 
(gg 
patientgg 
==gg 
nullgg 
)gg  
throwhh 
newhh  
KeyNotFoundExceptionhh .
(hh. /
$"hh/ 1
$strhh1 A
{hhA B
idhhB D
}hhD E
$strhhE P
"hhP Q
)hhQ R
;hhR S
patientjj 
.jj 
IsActivejj 
=jj 
truejj #
;jj# $
awaitll 
_patientRepositoryll $
.ll$ %
UpdateAsyncll% 0
(ll0 1
patientll1 8
)ll8 9
;ll9 :
awaitmm 
_patientRepositorymm $
.mm$ %
SaveChangesAsyncmm% 5
(mm5 6
)mm6 7
;mm7 8
}nn 	
privatepp 
staticpp 
voidpp 
ValidatePatientpp +
(pp+ ,
CreatePatientDtopp, <
dtopp= @
)pp@ A
{qq 	
ifrr 
(rr 
stringrr 
.rr 
IsNullOrWhiteSpacerr )
(rr) *
dtorr* -
.rr- .
FullNamerr. 6
)rr6 7
)rr7 8
throwss 
newss 
ArgumentExceptionss +
(ss+ ,
$strss, G
)ssG H
;ssH I
ifuu 
(uu 
dtouu 
.uu 
DateOfBirthuu 
>uu  !
DateOnlyuu" *
.uu* +
FromDateTimeuu+ 7
(uu7 8
DateTimeuu8 @
.uu@ A
TodayuuA F
)uuF G
)uuG H
throwvv 
newvv 
ArgumentExceptionvv +
(vv+ ,
$strvv, T
)vvT U
;vvU V
ifxx 
(xx 
dtoxx 
.xx 
DateOfBirthxx 
<xx  !
DateOnlyxx" *
.xx* +
FromDateTimexx+ 7
(xx7 8
DateTimexx8 @
.xx@ A
TodayxxA F
.xxF G
AddYearsxxG O
(xxO P
-xxP Q
$numxxQ T
)xxT U
)xxU V
)xxV W
throwyy 
newyy 
ArgumentExceptionyy +
(yy+ ,
$stryy, D
)yyD E
;yyE F
if{{ 
({{ 
string{{ 
.{{ 
IsNullOrWhiteSpace{{ )
({{) *
dto{{* -
.{{- .
PhoneNumber{{. 9
){{9 :
){{: ;
throw|| 
new|| 
ArgumentException|| +
(||+ ,
$str||, G
)||G H
;||H I
}}} 	
private 
static 
void 
ValidatePatient +
(+ ,
UpdatePatientDto, <
dto= @
)@ A
{
ÄÄ 	
if
ÅÅ 
(
ÅÅ 
string
ÅÅ 
.
ÅÅ  
IsNullOrWhiteSpace
ÅÅ )
(
ÅÅ) *
dto
ÅÅ* -
.
ÅÅ- .
FullName
ÅÅ. 6
)
ÅÅ6 7
)
ÅÅ7 8
throw
ÇÇ 
new
ÇÇ 
ArgumentException
ÇÇ +
(
ÇÇ+ ,
$str
ÇÇ, G
)
ÇÇG H
;
ÇÇH I
if
ÑÑ 
(
ÑÑ 
dto
ÑÑ 
.
ÑÑ 
DateOfBirth
ÑÑ 
>
ÑÑ  !
DateOnly
ÑÑ" *
.
ÑÑ* +
FromDateTime
ÑÑ+ 7
(
ÑÑ7 8
DateTime
ÑÑ8 @
.
ÑÑ@ A
Today
ÑÑA F
)
ÑÑF G
)
ÑÑG H
throw
ÖÖ 
new
ÖÖ 
ArgumentException
ÖÖ +
(
ÖÖ+ ,
$str
ÖÖ, T
)
ÖÖT U
;
ÖÖU V
if
áá 
(
áá 
dto
áá 
.
áá 
DateOfBirth
áá 
<
áá  !
DateOnly
áá" *
.
áá* +
FromDateTime
áá+ 7
(
áá7 8
DateTime
áá8 @
.
áá@ A
Today
ááA F
.
ááF G
AddYears
ááG O
(
ááO P
-
ááP Q
$num
ááQ T
)
ááT U
)
ááU V
)
ááV W
throw
àà 
new
àà 
ArgumentException
àà +
(
àà+ ,
$str
àà, D
)
ààD E
;
ààE F
if
ää 
(
ää 
string
ää 
.
ää  
IsNullOrWhiteSpace
ää )
(
ää) *
dto
ää* -
.
ää- .
PhoneNumber
ää. 9
)
ää9 :
)
ää: ;
throw
ãã 
new
ãã 
ArgumentException
ãã +
(
ãã+ ,
$str
ãã, G
)
ããG H
;
ããH I
}
åå 	
private
éé 
static
éé 

PatientDto
éé !
MapToPatientDto
éé" 1
(
éé1 2
Patient
éé2 9
patient
éé: A
)
ééA B
{
èè 	
return
êê 
new
êê 

PatientDto
êê !
{
ëë 
	PatientId
íí 
=
íí 
patient
íí #
.
íí# $
	PatientId
íí$ -
,
íí- .
FullName
ìì 
=
ìì 
patient
ìì "
.
ìì" #
FullName
ìì# +
,
ìì+ ,
DateOfBirth
îî 
=
îî 
patient
îî %
.
îî% &
DateOfBirth
îî& 1
,
îî1 2
Gender
ïï 
=
ïï 
patient
ïï  
.
ïï  !
Gender
ïï! '
,
ïï' (
PhoneNumber
ññ 
=
ññ 
patient
ññ %
.
ññ% &
PhoneNumber
ññ& 1
,
ññ1 2
Email
óó 
=
óó 
patient
óó 
.
óó  
Email
óó  %
,
óó% &
InsuranceId
òò 
=
òò 
patient
òò %
.
òò% &
InsuranceNumber
òò& 5
,
òò5 6
IsActive
ôô 
=
ôô 
patient
ôô "
.
ôô" #
IsActive
ôô# +
}
öö 
;
öö 
}
õõ 	
}
úú 
}ùù ”É
mC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Services\Implementation\HealthRecordService.cs
	namespace 	
S4_HealthAxisApi
 
. 
Services #
.# $
Implementation$ 2
{ 
public		 

class		 
HealthRecordService		 $
:		% & 
IHealthRecordService		' ;
{

 
private 
readonly #
IHealthRecordRepository 0#
_healthRecordRepository1 H
;H I
private 
readonly "
IAppointmentRepository /"
_appointmentRepository0 F
;F G
private 
readonly 
IPatientRepository +
_patientRepository, >
;> ?
private 
readonly 
IDoctorRepository *
_doctorRepository+ <
;< =
public 
HealthRecordService "
(" ##
IHealthRecordRepository #"
healthRecordRepository$ :
,: ;"
IAppointmentRepository "!
appointmentRepository# 8
,8 9
IPatientRepository 
patientRepository 0
,0 1
IDoctorRepository 
doctorRepository .
). /
{ 	#
_healthRecordRepository #
=$ %"
healthRecordRepository& <
;< ="
_appointmentRepository "
=# $!
appointmentRepository% :
;: ;
_patientRepository 
=  
patientRepository! 2
;2 3
_doctorRepository 
= 
doctorRepository  0
;0 1
} 	
public 
async 
Task 
< 
HealthRecordDto )
?) *
>* +
GetByIdAsync, 8
(8 9
int9 <
id= ?
)? @
{ 	
var 
record 
= 
await #
_healthRecordRepository 6
.6 7
GetByIdAsync7 C
(C D
idD F
)F G
;G H
return   
record   
==   
null   !
?!! 
null!! 
:"" 
MapToDto"" 
("" 
record"" !
)""! "
;""" #
}## 	
public%% 
async%% 
Task%% 
<%% 
HealthRecordDto%% )
?%%) *
>%%* +#
GetByAppointmentIdAsync%%, C
(%%C D
int%%D G
appointmentId%%H U
)%%U V
{&& 	
var'' 
record'' 
='' 
await(( #
_healthRecordRepository(( -
.((- .#
GetByAppointmentIdAsync((. E
(((E F
appointmentId((F S
)((S T
;((T U
return** 
record** 
==** 
null** !
?++ 
null++ 
:,, 
MapToDto,, 
(,, 
record,, !
),,! "
;,," #
}-- 	
public// 
async// 
Task// 
<// 
IEnumerable// %
<//% &
HealthRecordDto//& 5
>//5 6
>//6 7
GetByPatientIdAsync//8 K
(//K L
int//L O
	patientId//P Y
)//Y Z
{00 	
var11 
patient11 
=11 
await11 
_patientRepository11  2
.112 3
GetByIdAsync113 ?
(11? @
	patientId11@ I
)11I J
;11J K
if33 
(33 
patient33 
==33 
null33 
)33  
{44 
throw55 
new55  
KeyNotFoundException55 .
(55. /
$"66 
$str66 &
{66& '
	patientId66' 0
}660 1
$str661 <
"66< =
)66= >
;66> ?
}77 
var99 
records99 
=99 
await:: #
_healthRecordRepository:: -
.::- .
GetByPatientIdAsync::. A
(::A B
	patientId::B K
)::K L
;::L M
return<< 
records<< 
.<< 
Select<< !
(<<! "
MapToDto<<" *
)<<* +
;<<+ ,
}== 	
public?? 
async?? 
Task?? 
<?? 
HealthRecordDto?? )
>??) *
CreateAsync??+ 6
(??6 7!
CreateHealthRecordDto??7 L
dto??M P
)??P Q
{@@ 	
ValidateCreateDtoAA 
(AA 
dtoAA !
)AA! "
;AA" #
varCC 
appointmentCC 
=CC 
awaitDD "
_appointmentRepositoryDD ,
.DD, -
GetByIdAsyncDD- 9
(DD9 :
dtoDD: =
.DD= >
AppointmentIdDD> K
)DDK L
;DDL M
ifFF 
(FF 
appointmentFF 
==FF 
nullFF #
)FF# $
{GG 
throwHH 
newHH  
KeyNotFoundExceptionHH .
(HH. /
$strHH/ G
)HHG H
;HHH I
}II 
ifKK 
(KK 
appointmentKK 
.KK 
StatusKK "
!=KK# %
AppointmentStatusKK& 7
.KK7 8
	CompletedKK8 A
)KKA B
{LL 
throwMM 
newMM %
InvalidOperationExceptionMM 3
(MM3 4
$strNN S
)NNS T
;NNT U
}OO 
varQQ 
existingRecordQQ 
=QQ  
awaitRR #
_healthRecordRepositoryRR -
.RR- .#
GetByAppointmentIdAsyncRR. E
(RRE F
dtoSS 
.SS 
AppointmentIdSS %
)SS% &
;SS& '
ifUU 
(UU 
existingRecordUU 
!=UU !
nullUU" &
)UU& '
{VV 
throwWW 
newWW %
InvalidOperationExceptionWW 3
(WW3 4
$strXX J
)XXJ K
;XXK L
}YY 
var[[ 
patient[[ 
=[[ 
await\\ 
_patientRepository\\ (
.\\( )
GetByIdAsync\\) 5
(\\5 6
dto\\6 9
.\\9 :
	PatientId\\: C
)\\C D
;\\D E
if^^ 
(^^ 
patient^^ 
==^^ 
null^^ 
)^^  
{__ 
throw`` 
new``  
KeyNotFoundException`` .
(``. /
$str``/ C
)``C D
;``D E
}aa 
varcc 
doctorcc 
=cc 
awaitdd 
_doctorRepositorydd '
.dd' (
GetByIdAsyncdd( 4
(dd4 5
dtodd5 8
.dd8 9
DoctorIddd9 A
)ddA B
;ddB C
ifff 
(ff 
doctorff 
==ff 
nullff 
)ff 
{gg 
throwhh 
newhh  
KeyNotFoundExceptionhh .
(hh. /
$strhh/ B
)hhB C
;hhC D
}ii 
ifkk 
(kk 
appointmentkk 
.kk 
	PatientIdkk %
!=kk& (
dtokk) ,
.kk, -
	PatientIdkk- 6
)kk6 7
{ll 
throwmm 
newmm %
InvalidOperationExceptionmm 3
(mm3 4
$strnn 9
)nn9 :
;nn: ;
}oo 
ifqq 
(qq 
appointmentqq 
.qq 
DoctorIdqq $
!=qq% '
dtoqq( +
.qq+ ,
DoctorIdqq, 4
)qq4 5
{rr 
throwss 
newss %
InvalidOperationExceptionss 3
(ss3 4
$strtt 8
)tt8 9
;tt9 :
}uu 
varww 
recordww 
=ww 
newww 
HealthRecordww )
{xx 
AppointmentIdyy 
=yy 
dtoyy  #
.yy# $
AppointmentIdyy$ 1
,yy1 2
	PatientIdzz 
=zz 
dtozz 
.zz  
	PatientIdzz  )
,zz) *
DoctorId{{ 
={{ 
dto{{ 
.{{ 
DoctorId{{ '
,{{' (
	Diagnosis|| 
=|| 
dto|| 
.||  
	Diagnosis||  )
!||) *
.||* +
Trim||+ /
(||/ 0
)||0 1
,||1 2
Prescription}} 
=}} 
dto}} "
.}}" #
Prescription}}# /
!}}/ 0
.}}0 1
Trim}}1 5
(}}5 6
)}}6 7
,}}7 8
Notes~~ 
=~~ 
dto~~ 
.~~ 
Notes~~ !
?~~! "
.~~" #
Trim~~# '
(~~' (
)~~( )
,~~) *
	CreatedOn 
= 
DateTime $
.$ %
UtcNow% +
}
ÄÄ 
;
ÄÄ 
await
ÇÇ %
_healthRecordRepository
ÇÇ )
.
ÇÇ) *
AddAsync
ÇÇ* 2
(
ÇÇ2 3
record
ÇÇ3 9
)
ÇÇ9 :
;
ÇÇ: ;
await
ÉÉ %
_healthRecordRepository
ÉÉ )
.
ÉÉ) *
SaveChangesAsync
ÉÉ* :
(
ÉÉ: ;
)
ÉÉ; <
;
ÉÉ< =
var
ÖÖ 
createdRecord
ÖÖ 
=
ÖÖ 
await
ÜÜ %
_healthRecordRepository
ÜÜ -
.
ÜÜ- .
GetByIdAsync
ÜÜ. :
(
ÜÜ: ;
record
ÜÜ; A
.
ÜÜA B
HealthRecordId
ÜÜB P
)
ÜÜP Q
;
ÜÜQ R
return
àà 
MapToDto
àà 
(
àà 
createdRecord
àà )
??
àà* ,
record
àà- 3
)
àà3 4
;
àà4 5
}
ââ 	
public
ãã 
async
ãã 
Task
ãã 
UpdateAsync
ãã %
(
ãã% &
int
åå 
id
åå 
,
åå #
UpdateHealthRecordDto
çç !
dto
çç" %
)
çç% &
{
éé 	
ValidateUpdateDto
èè 
(
èè 
dto
èè !
)
èè! "
;
èè" #
var
ëë 
record
ëë 
=
ëë 
await
íí %
_healthRecordRepository
íí -
.
íí- .
GetByIdAsync
íí. :
(
íí: ;
id
íí; =
)
íí= >
;
íí> ?
if
îî 
(
îî 
record
îî 
==
îî 
null
îî 
)
îî 
{
ïï 
throw
ññ 
new
ññ "
KeyNotFoundException
ññ .
(
ññ. /
$"
óó 
$str
óó $
{
óó$ %
id
óó% '
}
óó' (
$str
óó( 3
"
óó3 4
)
óó4 5
;
óó5 6
}
òò 
record
öö 
.
öö 
	Diagnosis
öö 
=
öö 
dto
öö "
.
öö" #
	Diagnosis
öö# ,
!
öö, -
.
öö- .
Trim
öö. 2
(
öö2 3
)
öö3 4
;
öö4 5
record
õõ 
.
õõ 
Prescription
õõ 
=
õõ  !
dto
õõ" %
.
õõ% &
Prescription
õõ& 2
!
õõ2 3
.
õõ3 4
Trim
õõ4 8
(
õõ8 9
)
õõ9 :
;
õõ: ;
record
úú 
.
úú 
Notes
úú 
=
úú 
dto
úú 
.
úú 
Notes
úú $
?
úú$ %
.
úú% &
Trim
úú& *
(
úú* +
)
úú+ ,
;
úú, -
await
ûû %
_healthRecordRepository
ûû )
.
ûû) *
UpdateAsync
ûû* 5
(
ûû5 6
record
ûû6 <
)
ûû< =
;
ûû= >
await
üü %
_healthRecordRepository
üü )
.
üü) *
SaveChangesAsync
üü* :
(
üü: ;
)
üü; <
;
üü< =
}
†† 	
private
¢¢ 
static
¢¢ 
void
¢¢ 
ValidateCreateDto
¢¢ -
(
¢¢- .#
CreateHealthRecordDto
££ !
dto
££" %
)
££% &
{
§§ 	
if
•• 
(
•• 
dto
•• 
.
•• 
AppointmentId
•• !
<=
••" $
$num
••% &
)
••& '
{
¶¶ 
throw
ßß 
new
ßß 
ArgumentException
ßß +
(
ßß+ ,
$str
®® 0
)
®®0 1
;
®®1 2
}
©© 
if
´´ 
(
´´ 
dto
´´ 
.
´´ 
	PatientId
´´ 
<=
´´  
$num
´´! "
)
´´" #
{
¨¨ 
throw
≠≠ 
new
≠≠ 
ArgumentException
≠≠ +
(
≠≠+ ,
$str
ÆÆ ,
)
ÆÆ, -
;
ÆÆ- .
}
ØØ 
if
±± 
(
±± 
dto
±± 
.
±± 
DoctorId
±± 
<=
±± 
$num
±±  !
)
±±! "
{
≤≤ 
throw
≥≥ 
new
≥≥ 
ArgumentException
≥≥ +
(
≥≥+ ,
$str
¥¥ +
)
¥¥+ ,
;
¥¥, -
}
µµ 
if
∑∑ 
(
∑∑ 
string
∑∑ 
.
∑∑  
IsNullOrWhiteSpace
∑∑ )
(
∑∑) *
dto
∑∑* -
.
∑∑- .
	Diagnosis
∑∑. 7
)
∑∑7 8
)
∑∑8 9
{
∏∏ 
throw
ππ 
new
ππ 
ArgumentException
ππ +
(
ππ+ ,
$str
∫∫ ,
)
∫∫, -
;
∫∫- .
}
ªª 
if
ΩΩ 
(
ΩΩ 
string
ΩΩ 
.
ΩΩ  
IsNullOrWhiteSpace
ΩΩ )
(
ΩΩ) *
dto
ΩΩ* -
.
ΩΩ- .
Prescription
ΩΩ. :
)
ΩΩ: ;
)
ΩΩ; <
{
ææ 
throw
øø 
new
øø 
ArgumentException
øø +
(
øø+ ,
$str
¿¿ /
)
¿¿/ 0
;
¿¿0 1
}
¡¡ 
}
¬¬ 	
private
ƒƒ 
static
ƒƒ 
void
ƒƒ 
ValidateUpdateDto
ƒƒ -
(
ƒƒ- .#
UpdateHealthRecordDto
≈≈ !
dto
≈≈" %
)
≈≈% &
{
∆∆ 	
if
«« 
(
«« 
string
«« 
.
««  
IsNullOrWhiteSpace
«« )
(
««) *
dto
««* -
.
««- .
	Diagnosis
««. 7
)
««7 8
)
««8 9
{
»» 
throw
…… 
new
…… 
ArgumentException
…… +
(
……+ ,
$str
   ,
)
  , -
;
  - .
}
ÀÀ 
if
ÕÕ 
(
ÕÕ 
string
ÕÕ 
.
ÕÕ  
IsNullOrWhiteSpace
ÕÕ )
(
ÕÕ) *
dto
ÕÕ* -
.
ÕÕ- .
Prescription
ÕÕ. :
)
ÕÕ: ;
)
ÕÕ; <
{
ŒŒ 
throw
œœ 
new
œœ 
ArgumentException
œœ +
(
œœ+ ,
$str
–– /
)
––/ 0
;
––0 1
}
—— 
}
““ 	
private
‘‘ 
static
‘‘ 
HealthRecordDto
‘‘ &
MapToDto
‘‘' /
(
‘‘/ 0
HealthRecord
’’ 
record
’’ 
)
’’  
{
÷÷ 	
return
◊◊ 
new
◊◊ 
HealthRecordDto
◊◊ &
{
ÿÿ 
HealthRecordId
ŸŸ 
=
ŸŸ  
record
ŸŸ! '
.
ŸŸ' (
HealthRecordId
ŸŸ( 6
,
ŸŸ6 7
AppointmentId
⁄⁄ 
=
⁄⁄ 
record
⁄⁄  &
.
⁄⁄& '
AppointmentId
⁄⁄' 4
,
⁄⁄4 5
	PatientId
€€ 
=
€€ 
record
€€ "
.
€€" #
	PatientId
€€# ,
,
€€, -
DoctorId
‹‹ 
=
‹‹ 
record
‹‹ !
.
‹‹! "
DoctorId
‹‹" *
,
‹‹* +

DoctorName
›› 
=
›› 
record
›› #
.
››# $
Doctor
››$ *
?
››* +
.
››+ ,
FullName
››, 4
??
››5 7
string
››8 >
.
››> ?
Empty
››? D
,
››D E"
DoctorSpecialisation
ﬁﬁ $
=
ﬁﬁ% &
record
ﬁﬁ' -
.
ﬁﬁ- .
Doctor
ﬁﬁ. 4
==
ﬁﬁ5 7
null
ﬁﬁ8 <
?
ﬂﬂ 
$num
ﬂﬂ 
:
‡‡ 
(
‡‡ 
int
‡‡ 
)
‡‡ 
record
‡‡ !
.
‡‡! "
Doctor
‡‡" (
.
‡‡( )
Specialisation
‡‡) 7
,
‡‡7 8
	CreatedOn
·· 
=
·· 
record
·· "
.
··" #
	CreatedOn
··# ,
,
··, -
	Diagnosis
‚‚ 
=
‚‚ 
record
‚‚ "
.
‚‚" #
	Diagnosis
‚‚# ,
,
‚‚, -
Prescription
„„ 
=
„„ 
record
„„ %
.
„„% &
Prescription
„„& 2
,
„„2 3
Notes
‰‰ 
=
‰‰ 
record
‰‰ 
.
‰‰ 
Notes
‰‰ $
}
ÂÂ 
;
ÂÂ 
}
ÊÊ 	
}
ÁÁ 
}ËË „œ
gC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Services\Implementation\DoctorService.cs
	namespace

 	
S4_HealthAxisApi


 
.

 
Services

 #
.

# $
Implementation

$ 2
{ 
public 

class 
DoctorService 
:  
IDoctorService! /
{ 
private 
static 
readonly 
TimeSpan  (%
AvailabilityCacheDuration) B
=C D
TimeSpan 
. 
FromMinutes  
(  !
$num! "
)" #
;# $
private 
readonly 
IDoctorRepository *
_doctorRepository+ <
;< =
private 
readonly 
IUserService %
_userService& 2
;2 3
private 
readonly 
IDistributedCache *
_cache+ 1
;1 2
private 
readonly 
ILogger  
<  !
DoctorService! .
>. /
_logger0 7
;7 8
private 
readonly 
IPasswordHasher (
<( )
User) -
>- .
_passwordHasher/ >
;> ?
public 
DoctorService 
( 
IDoctorRepository 
doctorRepository .
,. /
IUserService 
userService $
,$ %
IDistributedCache 
cache #
,# $
ILogger 
< 
DoctorService !
>! "
logger# )
,) *
IPasswordHasher 
< 
User  
>  !
passwordHasher" 0
)0 1
{ 	
_doctorRepository 
= 
doctorRepository  0
;0 1
_userService 
= 
userService &
;& '
_cache   
=   
cache   
;   
_logger!! 
=!! 
logger!! 
;!! 
_passwordHasher"" 
="" 
passwordHasher"" ,
;"", -
}## 	
public%% 
async%% 
Task%% 
<%% 
IEnumerable%% %
<%%% &
	DoctorDto%%& /
>%%/ 0
>%%0 1
GetAllAsync%%2 =
(%%= >
string&& 
?&& 
sortBy&& 
,&& 
int'' 
?'' 
specialisation'' 
)''  
{(( 	
var)) 
doctors)) 
=)) 
await** 
_doctorRepository** '
.**' (
GetAllAsync**( 3
(**3 4
sortBy++ 
,++ 
specialisation,, "
),," #
;,,# $
return.. 
doctors.. 
... 
Select.. !
(..! "
MapToDoctorDto.." 0
)..0 1
;..1 2
}// 	
public11 
async11 
Task11 
<11 
IEnumerable11 %
<11% &
	DoctorDto11& /
>11/ 0
>110 1*
GetActiveBySpecialisationAsync112 P
(11P Q
int22 
specialisation22 
)22 
{33 	
if44 
(44 
!44 
Enum44 
.44 
	IsDefined44 
(44  
typeof44  &
(44& ' 
DoctorSpecialisation44' ;
)44; <
,44< =
specialisation44> L
)44L M
)44M N
{55 
throw66 
new66 
ArgumentException66 +
(66+ ,
$str66, L
)66L M
;66M N
}77 
var99 
doctors99 
=99 
await:: 
_doctorRepository:: '
.;; *
GetActiveBySpecialisationAsync;; 3
(;;3 4
specialisation<< &
)<<& '
;<<' (
return>> 
doctors>> 
.>> 
Select>> !
(>>! "
MapToDoctorDto>>" 0
)>>0 1
;>>1 2
}?? 	
publicAA 
asyncAA 
TaskAA 
<AA 
	DoctorDtoAA #
?AA# $
>AA$ %
GetByIdAsyncAA& 2
(AA2 3
intAA3 6
idAA7 9
)AA9 :
{BB 	
varCC 
doctorCC 
=CC 
awaitDD 
_doctorRepositoryDD '
.DD' (
GetByIdAsyncDD( 4
(DD4 5
idDD5 7
)DD7 8
;DD8 9
returnFF 
doctorFF 
==FF 
nullFF !
?GG 
nullGG 
:HH 
MapToDoctorDtoHH  
(HH  !
doctorHH! '
)HH' (
;HH( )
}II 	
publicKK 
asyncKK 
TaskKK 
<KK 
	DoctorDtoKK #
>KK# $
CreateAsyncKK% 0
(KK0 1
CreateDoctorDtoKK1 @
dtoKKA D
)KKD E
{LL 	
ValidateDoctorMM 
(MM 
dtoMM 
)MM 
;MM  
varOO 
doctorOO 
=OO 
newOO 
DoctorOO #
{PP 
FullNameQQ 
=QQ 
dtoQQ 
.QQ 
FullNameQQ '
.QQ' (
TrimQQ( ,
(QQ, -
)QQ- .
,QQ. /
EmailRR 
=RR 
dtoRR 
.RR 
EmailRR !
.RR! "
TrimRR" &
(RR& '
)RR' (
.RR( )
ToLowerRR) 0
(RR0 1
)RR1 2
,RR2 3
SpecialisationSS 
=SS  
(SS! " 
DoctorSpecialisationSS" 6
)SS6 7
dtoSS7 :
.SS: ;
SpecialisationSS; I
,SSI J
YearsOfExperienceTT !
=TT" #
dtoTT$ '
.TT' (
YearsOfExperienceTT( 9
,TT9 :
ConsultationFeeUU 
=UU  !
dtoUU" %
.UU% &
ConsultationFeeUU& 5
,UU5 6
IsActiveVV 
=VV 
trueVV 
}WW 
;WW 
awaitYY 
_doctorRepositoryYY #
.YY# $
AddAsyncYY$ ,
(YY, -
doctorYY- 3
)YY3 4
;YY4 5
awaitZZ 
_doctorRepositoryZZ #
.ZZ# $
SaveChangesAsyncZZ$ 4
(ZZ4 5
)ZZ5 6
;ZZ6 7
return\\ 
MapToDoctorDto\\ !
(\\! "
doctor\\" (
)\\( )
;\\) *
}]] 	
public__ 
async__ 
Task__ 
UpdateAsync__ %
(__% &
int`` 
id`` 
,`` 
UpdateDoctorDtoaa 
dtoaa 
)aa  
{bb 	
ValidateDoctorcc 
(cc 
dtocc 
)cc 
;cc  
varee 
doctoree 
=ee 
awaitff 
_doctorRepositoryff '
.ff' (
GetByIdAsyncff( 4
(ff4 5
idff5 7
)ff7 8
;ff8 9
ifhh 
(hh 
doctorhh 
==hh 
nullhh 
)hh 
{ii 
throwjj 
newjj  
KeyNotFoundExceptionjj .
(jj. /
$"kk 
$strkk %
{kk% &
idkk& (
}kk( )
$strkk) 4
"kk4 5
)kk5 6
;kk6 7
}ll 
doctornn 
.nn 
FullNamenn 
=nn 
dtonn !
.nn! "
FullNamenn" *
.nn* +
Trimnn+ /
(nn/ 0
)nn0 1
;nn1 2
doctoroo 
.oo 
Specialisationoo !
=oo" #
(oo$ % 
DoctorSpecialisationoo% 9
)oo9 :
dtooo: =
.oo= >
Specialisationoo> L
;ooL M
doctorpp 
.pp 
YearsOfExperiencepp $
=pp% &
dtopp' *
.pp* +
YearsOfExperiencepp+ <
;pp< =
doctorqq 
.qq 
ConsultationFeeqq "
=qq# $
dtoqq% (
.qq( )
ConsultationFeeqq) 8
;qq8 9
awaitss 
_doctorRepositoryss #
.ss# $
UpdateAsyncss$ /
(ss/ 0
doctorss0 6
)ss6 7
;ss7 8
awaittt 
_doctorRepositorytt #
.tt# $
SaveChangesAsynctt$ 4
(tt4 5
)tt5 6
;tt6 7
}uu 	
publicww 
asyncww 
Taskww 
<ww 
IEnumerableww %
<ww% &
intww& )
>ww) *
>ww* + 
GetAvailabilityAsyncww, @
(ww@ A
intxx 
doctorIdxx 
,xx 
DateOnlyyy 
dateyy 
)yy 
{zz 	
var{{ 
doctor{{ 
={{ 
await|| 
_doctorRepository|| '
.||' (
GetByIdAsync||( 4
(||4 5
doctorId||5 =
)||= >
;||> ?
if~~ 
(~~ 
doctor~~ 
==~~ 
null~~ 
)~~ 
{ 
throw
ÄÄ 
new
ÄÄ "
KeyNotFoundException
ÄÄ .
(
ÄÄ. /
$str
ÄÄ/ B
)
ÄÄB C
;
ÄÄC D
}
ÅÅ 
var
ÉÉ 
cacheKey
ÉÉ 
=
ÉÉ '
BuildAvailabilityCacheKey
ÑÑ )
(
ÑÑ) *
doctorId
ÑÑ* 2
,
ÑÑ2 3
date
ÑÑ4 8
)
ÑÑ8 9
;
ÑÑ9 :
var
ÜÜ  
cachedAvailability
ÜÜ "
=
ÜÜ# $
await
áá 
_cache
áá 
.
áá 
GetStringAsync
áá +
(
áá+ ,
cacheKey
áá, 4
)
áá4 5
;
áá5 6
if
ââ 
(
ââ 
!
ââ 
string
ââ 
.
ââ  
IsNullOrWhiteSpace
ââ *
(
ââ* + 
cachedAvailability
ââ+ =
)
ââ= >
)
ââ> ?
{
ää 
var
ãã 
cachedSlots
ãã 
=
ãã  !
JsonSerializer
åå "
.
åå" #
Deserialize
åå# .
<
åå. /
List
åå/ 3
<
åå3 4
int
åå4 7
>
åå7 8
>
åå8 9
(
åå9 : 
cachedAvailability
åå: L
)
ååL M
??
çç 
[
çç 
]
çç 
;
çç 
_logger
èè 
.
èè 
LogInformation
èè &
(
èè& '
$str
êõ 
,
õõ 
doctorId
úú 
,
úú 
date
ùù 
,
ùù 
cacheKey
ûû 
,
ûû 
cachedSlots
üü 
.
üü  
Count
üü  %
)
üü% &
;
üü& '
return
°° 
cachedSlots
°° "
;
°°" #
}
¢¢ 
_logger
§§ 
.
§§ 
LogInformation
§§ "
(
§§" #
$str
•± 
,
±± 
doctorId
≤≤ 
,
≤≤ 
date
≥≥ 
,
≥≥ 
cacheKey
¥¥ 
)
¥¥ 
;
¥¥ 
var
∂∂ 
bookedSlots
∂∂ 
=
∂∂ 
await
∑∑ 
_doctorRepository
∑∑ '
.
∑∑' (!
GetBookedSlotsAsync
∑∑( ;
(
∑∑; <
doctorId
∏∏ 
,
∏∏ 
date
ππ 
)
ππ 
;
ππ 
var
ªª 
allSlots
ªª 
=
ªª 
Enum
ºº 
.
ºº 
	GetValues
ºº 
<
ºº !
AppointmentTimeSlot
ºº 2
>
ºº2 3
(
ºº3 4
)
ºº4 5
.
ΩΩ 
Select
ΩΩ 
(
ΩΩ 
slot
ΩΩ  
=>
ΩΩ! #
(
ΩΩ$ %
int
ΩΩ% (
)
ΩΩ( )
slot
ΩΩ) -
)
ΩΩ- .
;
ΩΩ. /
var
øø 
availableSlots
øø 
=
øø  
allSlots
¿¿ 
.
¡¡ 
Except
¡¡ 
(
¡¡ 
bookedSlots
¡¡ '
)
¡¡' (
.
¬¬ 
ToList
¬¬ 
(
¬¬ 
)
¬¬ 
;
¬¬ 
var
ƒƒ $
serializedAvailability
ƒƒ &
=
ƒƒ' (
JsonSerializer
≈≈ 
.
≈≈ 
	Serialize
≈≈ (
(
≈≈( )
availableSlots
≈≈) 7
)
≈≈7 8
;
≈≈8 9
await
«« 
_cache
«« 
.
«« 
SetStringAsync
«« '
(
««' (
cacheKey
»» 
,
»» $
serializedAvailability
…… &
,
……& '
new
   *
DistributedCacheEntryOptions
   0
{
ÀÀ -
AbsoluteExpirationRelativeToNow
ÃÃ 3
=
ÃÃ4 5'
AvailabilityCacheDuration
ÕÕ 1
}
ŒŒ 
)
ŒŒ 
;
ŒŒ 
_logger
–– 
.
–– 
LogInformation
–– "
(
––" #
$str
—› 
,
›› 
doctorId
ﬁﬁ 
,
ﬁﬁ 
date
ﬂﬂ 
,
ﬂﬂ 
cacheKey
‡‡ 
,
‡‡ 
availableSlots
·· 
.
·· 
Count
·· $
,
··$ %'
AvailabilityCacheDuration
‚‚ )
.
‚‚) *
TotalMinutes
‚‚* 6
)
‚‚6 7
;
‚‚7 8
return
‰‰ 
availableSlots
‰‰ !
;
‰‰! "
}
ÂÂ 	
public
ÁÁ 
async
ÁÁ 
Task
ÁÁ 
<
ÁÁ %
DoctorCreationResultDto
ÁÁ 1
>
ÁÁ1 2*
CreateDoctorWithAccountAsync
ÁÁ3 O
(
ÁÁO P
CreateDoctorDto
ËË 
dto
ËË 
)
ËË  
{
ÈÈ 	
ValidateDoctor
ÍÍ 
(
ÍÍ 
dto
ÍÍ 
)
ÍÍ 
;
ÍÍ  
if
ÏÏ 
(
ÏÏ 
await
ÏÏ 
_userService
ÏÏ "
.
ÏÏ" #
EmailExistsAsync
ÏÏ# 3
(
ÏÏ3 4
dto
ÏÏ4 7
.
ÏÏ7 8
Email
ÏÏ8 =
)
ÏÏ= >
)
ÏÏ> ?
{
ÌÌ 
throw
ÓÓ 
new
ÓÓ 
ArgumentException
ÓÓ +
(
ÓÓ+ ,
$str
ÓÓ, C
)
ÓÓC D
;
ÓÓD E
}
ÔÔ 
var
ÒÒ 
doctor
ÒÒ 
=
ÒÒ 
new
ÒÒ 
Doctor
ÒÒ #
{
ÚÚ 
FullName
ÛÛ 
=
ÛÛ 
dto
ÛÛ 
.
ÛÛ 
FullName
ÛÛ '
.
ÛÛ' (
Trim
ÛÛ( ,
(
ÛÛ, -
)
ÛÛ- .
,
ÛÛ. /
Email
ÙÙ 
=
ÙÙ 
dto
ÙÙ 
.
ÙÙ 
Email
ÙÙ !
.
ÙÙ! "
Trim
ÙÙ" &
(
ÙÙ& '
)
ÙÙ' (
.
ÙÙ( )
ToLower
ÙÙ) 0
(
ÙÙ0 1
)
ÙÙ1 2
,
ÙÙ2 3
Specialisation
ıı 
=
ıı  
(
ıı! ""
DoctorSpecialisation
ıı" 6
)
ıı6 7
dto
ıı7 :
.
ıı: ;
Specialisation
ıı; I
,
ııI J
YearsOfExperience
ˆˆ !
=
ˆˆ" #
dto
ˆˆ$ '
.
ˆˆ' (
YearsOfExperience
ˆˆ( 9
,
ˆˆ9 :
ConsultationFee
˜˜ 
=
˜˜  !
dto
˜˜" %
.
˜˜% &
ConsultationFee
˜˜& 5
,
˜˜5 6
IsActive
¯¯ 
=
¯¯ 
true
¯¯ 
}
˘˘ 
;
˘˘ 
await
˚˚ 
_doctorRepository
˚˚ #
.
˚˚# $
AddAsync
˚˚$ ,
(
˚˚, -
doctor
˚˚- 3
)
˚˚3 4
;
˚˚4 5
await
¸¸ 
_doctorRepository
¸¸ #
.
¸¸# $
SaveChangesAsync
¸¸$ 4
(
¸¸4 5
)
¸¸5 6
;
¸¸6 7
var
˛˛ 
temporaryPassword
˛˛ !
=
˛˛" #'
GenerateTemporaryPassword
ˇˇ )
(
ˇˇ) *
)
ˇˇ* +
;
ˇˇ+ ,
var
ÅÅ 
user
ÅÅ 
=
ÅÅ 
new
ÅÅ 
User
ÅÅ 
{
ÇÇ 
Email
ÉÉ 
=
ÉÉ 
doctor
ÉÉ 
.
ÉÉ 
Email
ÉÉ $
,
ÉÉ$ %
Role
ÑÑ 
=
ÑÑ 
UserRole
ÑÑ 
.
ÑÑ  
Doctor
ÑÑ  &
,
ÑÑ& '
ReferenceId
ÖÖ 
=
ÖÖ 
doctor
ÖÖ $
.
ÖÖ$ %
DoctorId
ÖÖ% -
,
ÖÖ- .
CreatedDate
ÜÜ 
=
ÜÜ 
DateTime
ÜÜ &
.
ÜÜ& '
UtcNow
ÜÜ' -
,
ÜÜ- . 
MustChangePassword
áá "
=
áá# $
true
áá% )
}
àà 
;
àà 
user
ää 
.
ää 
PasswordHash
ää 
=
ää 
_passwordHasher
ãã 
.
ãã  
HashPassword
ãã  ,
(
ãã, -
user
åå 
,
åå 
temporaryPassword
çç %
)
çç% &
;
çç& '
await
èè 
_userService
èè 
.
èè 
CreateAsync
èè *
(
èè* +
user
èè+ /
)
èè/ 0
;
èè0 1
await
êê 
_userService
êê 
.
êê 
SaveChangesAsync
êê /
(
êê/ 0
)
êê0 1
;
êê1 2
return
íí 
new
íí %
DoctorCreationResultDto
íí .
{
ìì 
DoctorId
îî 
=
îî 
doctor
îî !
.
îî! "
DoctorId
îî" *
,
îî* +
FullName
ïï 
=
ïï 
doctor
ïï !
.
ïï! "
FullName
ïï" *
,
ïï* +
Email
ññ 
=
ññ 
doctor
ññ 
.
ññ 
Email
ññ $
,
ññ$ %
TemporaryPassword
óó !
=
óó" #
temporaryPassword
óó$ 5
}
òò 
;
òò 
}
ôô 	
public
õõ 
async
õõ 
Task
õõ 
ActivateAsync
õõ '
(
õõ' (
int
õõ( +
id
õõ, .
)
õõ. /
{
úú 	
var
ùù 
doctor
ùù 
=
ùù 
await
ûû 
_doctorRepository
ûû '
.
ûû' (
GetByIdAsync
ûû( 4
(
ûû4 5
id
ûû5 7
)
ûû7 8
;
ûû8 9
if
†† 
(
†† 
doctor
†† 
==
†† 
null
†† 
)
†† 
{
°° 
throw
¢¢ 
new
¢¢ "
KeyNotFoundException
¢¢ .
(
¢¢. /
$"
££ 
$str
££ %
{
££% &
id
££& (
}
££( )
$str
££) 4
"
££4 5
)
££5 6
;
££6 7
}
§§ 
doctor
¶¶ 
.
¶¶ 
IsActive
¶¶ 
=
¶¶ 
true
¶¶ "
;
¶¶" #
await
®® 
_doctorRepository
®® #
.
®®# $
UpdateAsync
®®$ /
(
®®/ 0
doctor
®®0 6
)
®®6 7
;
®®7 8
await
©© 
_doctorRepository
©© #
.
©©# $
SaveChangesAsync
©©$ 4
(
©©4 5
)
©©5 6
;
©©6 7
}
™™ 	
public
¨¨ 
async
¨¨ 
Task
¨¨ 
DeactivateAsync
¨¨ )
(
¨¨) *
int
¨¨* -
id
¨¨. 0
)
¨¨0 1
{
≠≠ 	
var
ÆÆ 
doctor
ÆÆ 
=
ÆÆ 
await
ØØ 
_doctorRepository
ØØ '
.
ØØ' (
GetByIdAsync
ØØ( 4
(
ØØ4 5
id
ØØ5 7
)
ØØ7 8
;
ØØ8 9
if
±± 
(
±± 
doctor
±± 
==
±± 
null
±± 
)
±± 
{
≤≤ 
throw
≥≥ 
new
≥≥ "
KeyNotFoundException
≥≥ .
(
≥≥. /
$"
¥¥ 
$str
¥¥ %
{
¥¥% &
id
¥¥& (
}
¥¥( )
$str
¥¥) 4
"
¥¥4 5
)
¥¥5 6
;
¥¥6 7
}
µµ 
doctor
∑∑ 
.
∑∑ 
IsActive
∑∑ 
=
∑∑ 
false
∑∑ #
;
∑∑# $
await
ππ 
_doctorRepository
ππ #
.
ππ# $
UpdateAsync
ππ$ /
(
ππ/ 0
doctor
ππ0 6
)
ππ6 7
;
ππ7 8
await
∫∫ 
_doctorRepository
∫∫ #
.
∫∫# $
SaveChangesAsync
∫∫$ 4
(
∫∫4 5
)
∫∫5 6
;
∫∫6 7
}
ªª 	
private
ΩΩ 
static
ΩΩ 
string
ΩΩ '
BuildAvailabilityCacheKey
ΩΩ 7
(
ΩΩ7 8
int
ææ 
doctorId
ææ 
,
ææ 
DateOnly
øø 
date
øø 
)
øø 
{
¿¿ 	
return
¡¡ 
$"
¡¡ 
$str
¡¡ 
{
¡¡ 
doctorId
¡¡ &
}
¡¡& '
$str
¡¡' 5
{
¡¡5 6
date
¡¡6 :
:
¡¡: ;
$str
¡¡; E
}
¡¡E F
"
¡¡F G
;
¡¡G H
}
¬¬ 	
private
ƒƒ 
static
ƒƒ 
void
ƒƒ 
ValidateDoctor
ƒƒ *
(
ƒƒ* +
CreateDoctorDto
ƒƒ+ :
dto
ƒƒ; >
)
ƒƒ> ?
{
≈≈ 	
if
∆∆ 
(
∆∆ 
string
∆∆ 
.
∆∆  
IsNullOrWhiteSpace
∆∆ )
(
∆∆) *
dto
∆∆* -
.
∆∆- .
FullName
∆∆. 6
)
∆∆6 7
)
∆∆7 8
{
«« 
throw
»» 
new
»» 
ArgumentException
»» +
(
»»+ ,
$str
»», F
)
»»F G
;
»»G H
}
…… 
if
ÀÀ 
(
ÀÀ 
string
ÀÀ 
.
ÀÀ  
IsNullOrWhiteSpace
ÀÀ )
(
ÀÀ) *
dto
ÀÀ* -
.
ÀÀ- .
Email
ÀÀ. 3
)
ÀÀ3 4
)
ÀÀ4 5
{
ÃÃ 
throw
ÕÕ 
new
ÕÕ 
ArgumentException
ÕÕ +
(
ÕÕ+ ,
$str
ÕÕ, @
)
ÕÕ@ A
;
ÕÕA B
}
ŒŒ 
if
–– 
(
–– 
!
–– 
Enum
–– 
.
–– 
	IsDefined
–– 
(
––  
typeof
––  &
(
––& '"
DoctorSpecialisation
––' ;
)
––; <
,
––< =
dto
––> A
.
––A B
Specialisation
––B P
)
––P Q
)
––Q R
{
—— 
throw
““ 
new
““ 
ArgumentException
““ +
(
““+ ,
$str
““, L
)
““L M
;
““M N
}
”” 
if
’’ 
(
’’ 
dto
’’ 
.
’’ 
YearsOfExperience
’’ %
<
’’& '
$num
’’( )
||
’’* ,
dto
÷÷ 
.
÷÷ 
YearsOfExperience
÷÷ %
>
÷÷& '
$num
÷÷( *
)
÷÷* +
{
◊◊ 
throw
ÿÿ 
new
ÿÿ 
ArgumentException
ÿÿ +
(
ÿÿ+ ,
$str
ŸŸ @
)
ŸŸ@ A
;
ŸŸA B
}
⁄⁄ 
if
‹‹ 
(
‹‹ 
dto
‹‹ 
.
‹‹ 
ConsultationFee
‹‹ #
<=
‹‹$ &
$num
‹‹' (
)
‹‹( )
{
›› 
throw
ﬁﬁ 
new
ﬁﬁ 
ArgumentException
ﬁﬁ +
(
ﬁﬁ+ ,
$str
ﬂﬂ A
)
ﬂﬂA B
;
ﬂﬂB C
}
‡‡ 
}
·· 	
private
„„ 
static
„„ 
void
„„ 
ValidateDoctor
„„ *
(
„„* +
UpdateDoctorDto
„„+ :
dto
„„; >
)
„„> ?
{
‰‰ 	
if
ÂÂ 
(
ÂÂ 
string
ÂÂ 
.
ÂÂ  
IsNullOrWhiteSpace
ÂÂ )
(
ÂÂ) *
dto
ÂÂ* -
.
ÂÂ- .
FullName
ÂÂ. 6
)
ÂÂ6 7
)
ÂÂ7 8
{
ÊÊ 
throw
ÁÁ 
new
ÁÁ 
ArgumentException
ÁÁ +
(
ÁÁ+ ,
$str
ÁÁ, F
)
ÁÁF G
;
ÁÁG H
}
ËË 
if
ÍÍ 
(
ÍÍ 
!
ÍÍ 
Enum
ÍÍ 
.
ÍÍ 
	IsDefined
ÍÍ 
(
ÍÍ  
typeof
ÍÍ  &
(
ÍÍ& '"
DoctorSpecialisation
ÍÍ' ;
)
ÍÍ; <
,
ÍÍ< =
dto
ÍÍ> A
.
ÍÍA B
Specialisation
ÍÍB P
)
ÍÍP Q
)
ÍÍQ R
{
ÎÎ 
throw
ÏÏ 
new
ÏÏ 
ArgumentException
ÏÏ +
(
ÏÏ+ ,
$str
ÏÏ, L
)
ÏÏL M
;
ÏÏM N
}
ÌÌ 
if
ÔÔ 
(
ÔÔ 
dto
ÔÔ 
.
ÔÔ 
YearsOfExperience
ÔÔ %
<
ÔÔ& '
$num
ÔÔ( )
||
ÔÔ* ,
dto
 
.
 
YearsOfExperience
 %
>
& '
$num
( *
)
* +
{
ÒÒ 
throw
ÚÚ 
new
ÚÚ 
ArgumentException
ÚÚ +
(
ÚÚ+ ,
$str
ÛÛ @
)
ÛÛ@ A
;
ÛÛA B
}
ÙÙ 
if
ˆˆ 
(
ˆˆ 
dto
ˆˆ 
.
ˆˆ 
ConsultationFee
ˆˆ #
<=
ˆˆ$ &
$num
ˆˆ' (
)
ˆˆ( )
{
˜˜ 
throw
¯¯ 
new
¯¯ 
ArgumentException
¯¯ +
(
¯¯+ ,
$str
˘˘ A
)
˘˘A B
;
˘˘B C
}
˙˙ 
}
˚˚ 	
private
˝˝ 
static
˝˝ 
string
˝˝ '
GenerateTemporaryPassword
˝˝ 7
(
˝˝7 8
)
˝˝8 9
{
˛˛ 	
return
ˇˇ 
$"
ˇˇ 
$str
ˇˇ 
{
ˇˇ 
Random
ˇˇ  
.
ˇˇ  !
Shared
ˇˇ! '
.
ˇˇ' (
Next
ˇˇ( ,
(
ˇˇ, -
$num
ˇˇ- 3
,
ˇˇ3 4
$num
ˇˇ5 ;
)
ˇˇ; <
}
ˇˇ< =
"
ˇˇ= >
;
ˇˇ> ?
}
ÄÄ 	
private
ÇÇ 
static
ÇÇ 
	DoctorDto
ÇÇ  
MapToDoctorDto
ÇÇ! /
(
ÇÇ/ 0
Doctor
ÇÇ0 6
doctor
ÇÇ7 =
)
ÇÇ= >
{
ÉÉ 	
return
ÑÑ 
new
ÑÑ 
	DoctorDto
ÑÑ  
{
ÖÖ 
DoctorId
ÜÜ 
=
ÜÜ 
doctor
ÜÜ !
.
ÜÜ! "
DoctorId
ÜÜ" *
,
ÜÜ* +
FullName
áá 
=
áá 
doctor
áá !
.
áá! "
FullName
áá" *
,
áá* +
Email
àà 
=
àà 
doctor
àà 
.
àà 
Email
àà $
,
àà$ %
Specialisation
ââ 
=
ââ  
(
ââ! "
int
ââ" %
)
ââ% &
doctor
ââ& ,
.
ââ, -
Specialisation
ââ- ;
,
ââ; <
YearsOfExperience
ää !
=
ää" #
doctor
ää$ *
.
ää* +
YearsOfExperience
ää+ <
,
ää< =
ConsultationFee
ãã 
=
ãã  !
doctor
ãã" (
.
ãã( )
ConsultationFee
ãã) 8
,
ãã8 9
IsActive
åå 
=
åå 
doctor
åå !
.
åå! "
IsActive
åå" *
}
çç 
;
çç 
}
éé 	
}
èè 
}êê üˆ
eC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Services\Implementation\AuthService.cs
	namespace 	
S4_HealthAxisApi
 
. 
Services #
.# $
Implementation$ 2
{ 
public 

class 
AuthService 
: 
IAuthService +
{ 
private 
readonly 
IUserRepository (
_userRepository) 8
;8 9
private 
readonly 
IPatientRepository +
_patientRepository, >
;> ?
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
IPasswordHasher (
<( )
User) -
>- .
_passwordHasher/ >
;> ?
public 
AuthService 
( 
IUserRepository 
userRepository *
,* +
IPatientRepository 
patientRepository 0
,0 1
IConfiguration 
configuration (
,( )
IPasswordHasher 
< 
User  
>  !
passwordHasher" 0
)0 1
{ 	
_userRepository 
= 
userRepository ,
;, -
_patientRepository 
=  
patientRepository! 2
;2 3
_configuration 
= 
configuration *
;* +
_passwordHasher 
= 
passwordHasher ,
;, -
}   	
public"" 
async"" 
Task"" 
<"" 
("" 
bool"" 
Success""  '
,""' (
string"") /
Message""0 7
,""7 8
AuthResponseDto""9 H
?""H I
Data""J N
)""N O
>""O P
RegisterAsync""Q ^
(""^ _
RegisterDto## 
request## 
)##  
{$$ 	
if%% 
(%% 
request%% 
.%% 
Password%%  
!=%%! #
request%%$ +
.%%+ ,
ConfirmPassword%%, ;
)%%; <
{&& 
return'' 
('' 
false'' 
,'' 
$str'' 8
,''8 9
null'': >
)''> ?
;''? @
}(( 
var** 
email** 
=** 
request** 
.**  
Email**  %
.**% &
Trim**& *
(*** +
)**+ ,
.**, -
ToLower**- 4
(**4 5
)**5 6
;**6 7
if,, 
(,, 
await,, 
_userRepository,, %
.,,% &
EmailExistsAsync,,& 6
(,,6 7
email,,7 <
),,< =
),,= >
{-- 
return.. 
(.. 
false.. 
,.. 
$str.. 6
,..6 7
null..8 <
)..< =
;..= >
}// 
var11 
user11 
=11 
new11 
User11 
{22 
Email33 
=33 
email33 
,33 
Role44 
=44 
request44 
.44 
Role44 #
,44# $
CreatedDate55 
=55 
DateTime55 &
.55& '
UtcNow55' -
,55- .
MustChangePassword66 "
=66# $
false66% *
}77 
;77 
user99 
.99 
PasswordHash99 
=99 
_passwordHasher:: 
.::  
HashPassword::  ,
(::, -
user::- 1
,::1 2
request::3 :
.::: ;
Password::; C
)::C D
;::D E
var<< 
refreshToken<< 
=<<  
GenerateRefreshToken<< 3
(<<3 4
)<<4 5
;<<5 6
user>> 
.>> 
RefreshToken>> 
=>> 
refreshToken>>  ,
;>>, -
user?? 
.?? "
RefreshTokenExpiryTime?? '
=??( )
DateTime??* 2
.??2 3
UtcNow??3 9
.??9 :
AddDays??: A
(??A B
$num??B C
)??C D
;??D E
awaitAA 
_userRepositoryAA !
.AA! "
AddAsyncAA" *
(AA* +
userAA+ /
)AA/ 0
;AA0 1
awaitBB 
_userRepositoryBB !
.BB! "
SaveChangesAsyncBB" 2
(BB2 3
)BB3 4
;BB4 5
varDD 
accessTokenDD 
=DD 
GenerateTokenDD +
(DD+ ,
userDD, 0
)DD0 1
;DD1 2
returnFF 
(FF 
trueGG 
,GG 
$strHH /
,HH/ 0
newII 
AuthResponseDtoII #
{JJ 
AccessTokenKK 
=KK  !
accessTokenKK" -
,KK- .
RefreshTokenLL  
=LL! "
refreshTokenLL# /
,LL/ 0
EmailMM 
=MM 
userMM  
.MM  !
EmailMM! &
,MM& '
RoleNN 
=NN 
userNN 
.NN  
RoleNN  $
.NN$ %
ToStringNN% -
(NN- .
)NN. /
,NN/ 0
ReferenceIdOO 
=OO  !
userOO" &
.OO& '
ReferenceIdOO' 2
,OO2 3
MustChangePasswordPP &
=PP' (
userPP) -
.PP- .
MustChangePasswordPP. @
}QQ 
)QQ 
;QQ 
}RR 	
publicTT 
asyncTT 
TaskTT 
<TT 
(TT 
boolTT 
SuccessTT  '
,TT' (
stringTT) /
MessageTT0 7
,TT7 8
AuthResponseDtoTT9 H
?TTH I
DataTTJ N
)TTN O
>TTO P 
RegisterPatientAsyncTTQ e
(TTe f
RegisterPatientDtoUU 
requestUU &
)UU& '
{VV 	
ifWW 
(WW 
requestWW 
.WW 
PasswordWW  
!=WW! #
requestWW$ +
.WW+ ,
ConfirmPasswordWW, ;
)WW; <
{XX 
returnYY 
(YY 
falseYY 
,YY 
$strYY 8
,YY8 9
nullYY: >
)YY> ?
;YY? @
}ZZ 
var\\ 
email\\ 
=\\ 
request\\ 
.\\  
Email\\  %
.\\% &
Trim\\& *
(\\* +
)\\+ ,
.\\, -
ToLower\\- 4
(\\4 5
)\\5 6
;\\6 7
if^^ 
(^^ 
await^^ 
_userRepository^^ %
.^^% &
EmailExistsAsync^^& 6
(^^6 7
email^^7 <
)^^< =
)^^= >
{__ 
return`` 
(`` 
false`` 
,`` 
$str`` 6
,``6 7
null``8 <
)``< =
;``= >
}aa 
varcc 
patientcc 
=cc 
newcc 
Patientcc %
{dd 
FullNameee 
=ee 
requestee "
.ee" #
FullNameee# +
.ee+ ,
Trimee, 0
(ee0 1
)ee1 2
,ee2 3
DateOfBirthff 
=ff 
requestff %
.ff% &
DateOfBirthff& 1
,ff1 2
Gendergg 
=gg 
requestgg  
.gg  !
Gendergg! '
,gg' (
PhoneNumberhh 
=hh 
requesthh %
.hh% &
PhoneNumberhh& 1
.hh1 2
Trimhh2 6
(hh6 7
)hh7 8
,hh8 9
Emailii 
=ii 
emailii 
,ii 
InsuranceNumberjj 
=jj  !
requestjj" )
.jj) *
InsuranceNumberjj* 9
,jj9 :
IsActivekk 
=kk 
truekk 
}ll 
;ll 
awaitnn 
_patientRepositorynn $
.nn$ %
AddAsyncnn% -
(nn- .
patientnn. 5
)nn5 6
;nn6 7
awaitoo 
_patientRepositoryoo $
.oo$ %
SaveChangesAsyncoo% 5
(oo5 6
)oo6 7
;oo7 8
varqq 
userqq 
=qq 
newqq 
Userqq 
{rr 
Emailss 
=ss 
emailss 
,ss 
Rolett 
=tt 
UserRolett 
.tt  
Patienttt  '
,tt' (
ReferenceIduu 
=uu 
patientuu %
.uu% &
	PatientIduu& /
,uu/ 0
CreatedDatevv 
=vv 
DateTimevv &
.vv& '
UtcNowvv' -
,vv- .
MustChangePasswordww "
=ww# $
falseww% *
}xx 
;xx 
userzz 
.zz 
PasswordHashzz 
=zz 
_passwordHasher{{ 
.{{  
HashPassword{{  ,
({{, -
user{{- 1
,{{1 2
request{{3 :
.{{: ;
Password{{; C
){{C D
;{{D E
var}} 
refreshToken}} 
=}}  
GenerateRefreshToken}} 3
(}}3 4
)}}4 5
;}}5 6
user 
. 
RefreshToken 
= 
refreshToken  ,
;, -
user
ÄÄ 
.
ÄÄ $
RefreshTokenExpiryTime
ÄÄ '
=
ÄÄ( )
DateTime
ÄÄ* 2
.
ÄÄ2 3
UtcNow
ÄÄ3 9
.
ÄÄ9 :
AddDays
ÄÄ: A
(
ÄÄA B
$num
ÄÄB C
)
ÄÄC D
;
ÄÄD E
await
ÇÇ 
_userRepository
ÇÇ !
.
ÇÇ! "
AddAsync
ÇÇ" *
(
ÇÇ* +
user
ÇÇ+ /
)
ÇÇ/ 0
;
ÇÇ0 1
await
ÉÉ 
_userRepository
ÉÉ !
.
ÉÉ! "
SaveChangesAsync
ÉÉ" 2
(
ÉÉ2 3
)
ÉÉ3 4
;
ÉÉ4 5
var
ÖÖ 
accessToken
ÖÖ 
=
ÖÖ 
GenerateToken
ÖÖ +
(
ÖÖ+ ,
user
ÖÖ, 0
)
ÖÖ0 1
;
ÖÖ1 2
return
áá 
(
áá 
true
àà 
,
àà 
$str
ââ 2
,
ââ2 3
new
ää 
AuthResponseDto
ää #
{
ãã 
AccessToken
åå 
=
åå  !
accessToken
åå" -
,
åå- .
RefreshToken
çç  
=
çç! "
refreshToken
çç# /
,
çç/ 0
Email
éé 
=
éé 
user
éé  
.
éé  !
Email
éé! &
,
éé& '
Role
èè 
=
èè 
user
èè 
.
èè  
Role
èè  $
.
èè$ %
ToString
èè% -
(
èè- .
)
èè. /
,
èè/ 0
ReferenceId
êê 
=
êê  !
user
êê" &
.
êê& '
ReferenceId
êê' 2
,
êê2 3 
MustChangePassword
ëë &
=
ëë' (
user
ëë) -
.
ëë- . 
MustChangePassword
ëë. @
}
íí 
)
íí 
;
íí 
}
ìì 	
public
ïï 
async
ïï 
Task
ïï 
<
ïï 
(
ïï 
bool
ïï 
Success
ïï  '
,
ïï' (
string
ïï) /
Message
ïï0 7
,
ïï7 8
AuthResponseDto
ïï9 H
?
ïïH I
Data
ïïJ N
)
ïïN O
>
ïïO P

LoginAsync
ïïQ [
(
ïï[ \
LoginDto
ññ 
request
ññ 
)
ññ 
{
óó 	
var
òò 
email
òò 
=
òò 
request
òò 
.
òò  
Email
òò  %
.
òò% &
Trim
òò& *
(
òò* +
)
òò+ ,
.
òò, -
ToLower
òò- 4
(
òò4 5
)
òò5 6
;
òò6 7
var
öö 
user
öö 
=
öö 
await
öö 
_userRepository
öö ,
.
öö, -
GetByEmailAsync
öö- <
(
öö< =
email
öö= B
)
ööB C
;
ööC D
if
úú 
(
úú 
user
úú 
==
úú 
null
úú 
)
úú 
{
ùù 
return
ûû 
(
ûû 
false
ûû 
,
ûû 
$str
ûû ;
,
ûû; <
null
ûû= A
)
ûûA B
;
ûûB C
}
üü 
var
°°  
verificationResult
°° "
=
°°# $
_passwordHasher
¢¢ 
.
¢¢  "
VerifyHashedPassword
¢¢  4
(
¢¢4 5
user
££ 
,
££ 
user
§§ 
.
§§ 
PasswordHash
§§ %
,
§§% &
request
•• 
.
•• 
Password
•• $
)
••$ %
;
••% &
if
ßß 
(
ßß  
verificationResult
ßß "
==
ßß# %(
PasswordVerificationResult
ßß& @
.
ßß@ A
Failed
ßßA G
)
ßßG H
{
®® 
return
©© 
(
©© 
false
©© 
,
©© 
$str
©© ;
,
©©; <
null
©©= A
)
©©A B
;
©©B C
}
™™ 
var
¨¨ 
accessToken
¨¨ 
=
¨¨ 
GenerateToken
¨¨ +
(
¨¨+ ,
user
¨¨, 0
)
¨¨0 1
;
¨¨1 2
var
≠≠ 
refreshToken
≠≠ 
=
≠≠ "
GenerateRefreshToken
≠≠ 3
(
≠≠3 4
)
≠≠4 5
;
≠≠5 6
user
ØØ 
.
ØØ 
RefreshToken
ØØ 
=
ØØ 
refreshToken
ØØ  ,
;
ØØ, -
user
∞∞ 
.
∞∞ $
RefreshTokenExpiryTime
∞∞ '
=
∞∞( )
DateTime
∞∞* 2
.
∞∞2 3
UtcNow
∞∞3 9
.
∞∞9 :
AddDays
∞∞: A
(
∞∞A B
$num
∞∞B C
)
∞∞C D
;
∞∞D E
await
≤≤ 
_userRepository
≤≤ !
.
≤≤! "
UpdateAsync
≤≤" -
(
≤≤- .
user
≤≤. 2
)
≤≤2 3
;
≤≤3 4
await
≥≥ 
_userRepository
≥≥ !
.
≥≥! "
SaveChangesAsync
≥≥" 2
(
≥≥2 3
)
≥≥3 4
;
≥≥4 5
return
µµ 
(
µµ 
true
∂∂ 
,
∂∂ 
$str
∑∑ #
,
∑∑# $
new
∏∏ 
AuthResponseDto
∏∏ #
{
ππ 
AccessToken
∫∫ 
=
∫∫  !
accessToken
∫∫" -
,
∫∫- .
RefreshToken
ªª  
=
ªª! "
refreshToken
ªª# /
,
ªª/ 0
Email
ºº 
=
ºº 
user
ºº  
.
ºº  !
Email
ºº! &
,
ºº& '
Role
ΩΩ 
=
ΩΩ 
user
ΩΩ 
.
ΩΩ  
Role
ΩΩ  $
.
ΩΩ$ %
ToString
ΩΩ% -
(
ΩΩ- .
)
ΩΩ. /
,
ΩΩ/ 0
ReferenceId
ææ 
=
ææ  !
user
ææ" &
.
ææ& '
ReferenceId
ææ' 2
,
ææ2 3 
MustChangePassword
øø &
=
øø' (
user
øø) -
.
øø- . 
MustChangePassword
øø. @
}
¿¿ 
)
¿¿ 
;
¿¿ 
}
¡¡ 	
public
√√ 
async
√√ 
Task
√√ 
<
√√ 
(
√√ 
bool
√√ 
Success
√√  '
,
√√' (
string
√√) /
Message
√√0 7
,
√√7 8
AuthResponseDto
√√9 H
?
√√H I
Data
√√J N
)
√√N O
>
√√O P
RefreshTokenAsync
√√Q b
(
√√b c
RefreshTokenDto
ƒƒ 
request
ƒƒ #
)
ƒƒ# $
{
≈≈ 	
var
∆∆ 
user
∆∆ 
=
∆∆ 
await
«« 
_userRepository
«« %
.
««% &$
GetByRefreshTokenAsync
««& <
(
««< =
request
»» 
.
»» 
RefreshToken
»» (
)
»»( )
;
»») *
if
   
(
   
user
   
==
   
null
   
)
   
{
ÀÀ 
return
ÃÃ 
(
ÃÃ 
false
ÃÃ 
,
ÃÃ 
$str
ÃÃ 7
,
ÃÃ7 8
null
ÃÃ9 =
)
ÃÃ= >
;
ÃÃ> ?
}
ÕÕ 
if
œœ 
(
œœ 
!
œœ 
user
œœ 
.
œœ $
RefreshTokenExpiryTime
œœ ,
.
œœ, -
HasValue
œœ- 5
||
œœ6 8
user
–– 
.
–– $
RefreshTokenExpiryTime
–– +
.
––+ ,
Value
––, 1
<=
––2 4
DateTime
––5 =
.
––= >
UtcNow
––> D
)
––D E
{
—— 
return
““ 
(
““ 
false
““ 
,
““ 
$str
““ ;
,
““; <
null
““= A
)
““A B
;
““B C
}
”” 
var
’’ 
newAccessToken
’’ 
=
’’  
GenerateToken
’’! .
(
’’. /
user
’’/ 3
)
’’3 4
;
’’4 5
var
÷÷ 
newRefreshToken
÷÷ 
=
÷÷  !"
GenerateRefreshToken
÷÷" 6
(
÷÷6 7
)
÷÷7 8
;
÷÷8 9
user
ÿÿ 
.
ÿÿ 
RefreshToken
ÿÿ 
=
ÿÿ 
newRefreshToken
ÿÿ  /
;
ÿÿ/ 0
user
ŸŸ 
.
ŸŸ $
RefreshTokenExpiryTime
ŸŸ '
=
ŸŸ( )
DateTime
ŸŸ* 2
.
ŸŸ2 3
UtcNow
ŸŸ3 9
.
ŸŸ9 :
AddDays
ŸŸ: A
(
ŸŸA B
$num
ŸŸB C
)
ŸŸC D
;
ŸŸD E
await
€€ 
_userRepository
€€ !
.
€€! "
UpdateAsync
€€" -
(
€€- .
user
€€. 2
)
€€2 3
;
€€3 4
await
‹‹ 
_userRepository
‹‹ !
.
‹‹! "
SaveChangesAsync
‹‹" 2
(
‹‹2 3
)
‹‹3 4
;
‹‹4 5
return
ﬁﬁ 
(
ﬁﬁ 
true
ﬂﬂ 
,
ﬂﬂ 
$str
‡‡ /
,
‡‡/ 0
new
·· 
AuthResponseDto
·· #
{
‚‚ 
AccessToken
„„ 
=
„„  !
newAccessToken
„„" 0
,
„„0 1
RefreshToken
‰‰  
=
‰‰! "
newRefreshToken
‰‰# 2
,
‰‰2 3
Email
ÂÂ 
=
ÂÂ 
user
ÂÂ  
.
ÂÂ  !
Email
ÂÂ! &
,
ÂÂ& '
Role
ÊÊ 
=
ÊÊ 
user
ÊÊ 
.
ÊÊ  
Role
ÊÊ  $
.
ÊÊ$ %
ToString
ÊÊ% -
(
ÊÊ- .
)
ÊÊ. /
,
ÊÊ/ 0
ReferenceId
ÁÁ 
=
ÁÁ  !
user
ÁÁ" &
.
ÁÁ& '
ReferenceId
ÁÁ' 2
,
ÁÁ2 3 
MustChangePassword
ËË &
=
ËË' (
user
ËË) -
.
ËË- . 
MustChangePassword
ËË. @
}
ÈÈ 
)
ÈÈ 
;
ÈÈ 
}
ÍÍ 	
public
ÏÏ 
async
ÏÏ 
Task
ÏÏ 
<
ÏÏ 
(
ÏÏ 
bool
ÏÏ 
Success
ÏÏ  '
,
ÏÏ' (
string
ÏÏ) /
Message
ÏÏ0 7
)
ÏÏ7 8
>
ÏÏ8 9!
ChangePasswordAsync
ÏÏ: M
(
ÏÏM N
string
ÌÌ 
email
ÌÌ 
,
ÌÌ 
ChangePasswordDto
ÓÓ 
request
ÓÓ %
)
ÓÓ% &
{
ÔÔ 	
if
 
(
 
string
 
.
  
IsNullOrWhiteSpace
 )
(
) *
email
* /
)
/ 0
)
0 1
{
ÒÒ 
return
ÚÚ 
(
ÚÚ 
false
ÚÚ 
,
ÚÚ 
$str
ÚÚ <
)
ÚÚ< =
;
ÚÚ= >
}
ÛÛ 
if
ıı 
(
ıı 
string
ıı 
.
ıı  
IsNullOrWhiteSpace
ıı )
(
ıı) *
request
ıı* 1
.
ıı1 2
CurrentPassword
ıı2 A
)
ııA B
)
ııB C
{
ˆˆ 
return
˜˜ 
(
˜˜ 
false
˜˜ 
,
˜˜ 
$str
˜˜ >
)
˜˜> ?
;
˜˜? @
}
¯¯ 
if
˙˙ 
(
˙˙ 
string
˙˙ 
.
˙˙  
IsNullOrWhiteSpace
˙˙ )
(
˙˙) *
request
˙˙* 1
.
˙˙1 2
NewPassword
˙˙2 =
)
˙˙= >
)
˙˙> ?
{
˚˚ 
return
¸¸ 
(
¸¸ 
false
¸¸ 
,
¸¸ 
$str
¸¸ :
)
¸¸: ;
;
¸¸; <
}
˝˝ 
if
ˇˇ 
(
ˇˇ 
string
ˇˇ 
.
ˇˇ  
IsNullOrWhiteSpace
ˇˇ )
(
ˇˇ) *
request
ˇˇ* 1
.
ˇˇ1 2 
ConfirmNewPassword
ˇˇ2 D
)
ˇˇD E
)
ˇˇE F
{
ÄÄ 
return
ÅÅ 
(
ÅÅ 
false
ÅÅ 
,
ÅÅ 
$str
ÅÅ >
)
ÅÅ> ?
;
ÅÅ? @
}
ÇÇ 
if
ÑÑ 
(
ÑÑ 
request
ÑÑ 
.
ÑÑ 
NewPassword
ÑÑ #
!=
ÑÑ$ &
request
ÑÑ' .
.
ÑÑ. / 
ConfirmNewPassword
ÑÑ/ A
)
ÑÑA B
{
ÖÖ 
return
ÜÜ 
(
ÜÜ 
false
ÜÜ 
,
ÜÜ 
$str
ÜÜ P
)
ÜÜP Q
;
ÜÜQ R
}
áá 
if
ââ 
(
ââ 
request
ââ 
.
ââ 
CurrentPassword
ââ '
==
ââ( *
request
ââ+ 2
.
ââ2 3
NewPassword
ââ3 >
)
ââ> ?
{
ää 
return
ãã 
(
ãã 
false
ãã 
,
ãã 
$str
ãã U
)
ããU V
;
ããV W
}
åå 
var
éé '
passwordValidationMessage
éé )
=
éé* +&
ValidatePasswordStrength
éé, D
(
ééD E
request
ééE L
.
ééL M
NewPassword
ééM X
)
ééX Y
;
ééY Z
if
êê 
(
êê 
!
êê 
string
êê 
.
êê  
IsNullOrWhiteSpace
êê *
(
êê* +'
passwordValidationMessage
êê+ D
)
êêD E
)
êêE F
{
ëë 
return
íí 
(
íí 
false
íí 
,
íí '
passwordValidationMessage
íí 8
)
íí8 9
;
íí9 :
}
ìì 
var
ïï 
user
ïï 
=
ïï 
await
ññ 
_userRepository
ññ %
.
ññ% &
GetByEmailAsync
ññ& 5
(
ññ5 6
email
óó 
.
óó 
Trim
óó 
(
óó 
)
óó  
.
óó  !
ToLower
óó! (
(
óó( )
)
óó) *
)
óó* +
;
óó+ ,
if
ôô 
(
ôô 
user
ôô 
==
ôô 
null
ôô 
)
ôô 
{
öö 
return
õõ 
(
õõ 
false
õõ 
,
õõ 
$str
õõ 8
)
õõ8 9
;
õõ9 :
}
úú 
var
ûû /
!currentPasswordVerificationResult
ûû 1
=
ûû2 3
_passwordHasher
üü 
.
üü  "
VerifyHashedPassword
üü  4
(
üü4 5
user
†† 
,
†† 
user
°° 
.
°° 
PasswordHash
°° %
,
°°% &
request
¢¢ 
.
¢¢ 
CurrentPassword
¢¢ +
)
¢¢+ ,
;
¢¢, -
if
§§ 
(
§§ /
!currentPasswordVerificationResult
§§ 1
==
§§2 4(
PasswordVerificationResult
§§5 O
.
§§O P
Failed
§§P V
)
§§V W
{
•• 
return
¶¶ 
(
¶¶ 
false
¶¶ 
,
¶¶ 
$str
¶¶ ?
)
¶¶? @
;
¶¶@ A
}
ßß 
user
©© 
.
©© 
PasswordHash
©© 
=
©© 
_passwordHasher
™™ 
.
™™  
HashPassword
™™  ,
(
™™, -
user
™™- 1
,
™™1 2
request
™™3 :
.
™™: ;
NewPassword
™™; F
)
™™F G
;
™™G H
user
¨¨ 
.
¨¨  
MustChangePassword
¨¨ #
=
¨¨$ %
false
¨¨& +
;
¨¨+ ,
await
ÆÆ 
_userRepository
ÆÆ !
.
ÆÆ! "
UpdateAsync
ÆÆ" -
(
ÆÆ- .
user
ÆÆ. 2
)
ÆÆ2 3
;
ÆÆ3 4
await
ØØ 
_userRepository
ØØ !
.
ØØ! "
SaveChangesAsync
ØØ" 2
(
ØØ2 3
)
ØØ3 4
;
ØØ4 5
return
±± 
(
±± 
true
±± 
,
±± 
$str
±± :
)
±±: ;
;
±±; <
}
≤≤ 	
private
¥¥ 
static
¥¥ 
string
¥¥ 
?
¥¥ &
ValidatePasswordStrength
¥¥ 7
(
¥¥7 8
string
¥¥8 >
password
¥¥? G
)
¥¥G H
{
µµ 	
if
∂∂ 
(
∂∂ 
password
∂∂ 
.
∂∂ 
Length
∂∂ 
<
∂∂  !
$num
∂∂" #
)
∂∂# $
{
∑∑ 
return
∏∏ 
$str
∏∏ E
;
∏∏E F
}
ππ 
if
ªª 
(
ªª 
!
ªª 
password
ªª 
.
ªª 
Any
ªª 
(
ªª 
char
ªª "
.
ªª" #
IsUpper
ªª# *
)
ªª* +
)
ªª+ ,
{
ºº 
return
ΩΩ 
$str
ΩΩ M
;
ΩΩM N
}
ææ 
if
¿¿ 
(
¿¿ 
!
¿¿ 
password
¿¿ 
.
¿¿ 
Any
¿¿ 
(
¿¿ 
char
¿¿ "
.
¿¿" #
IsLower
¿¿# *
)
¿¿* +
)
¿¿+ ,
{
¡¡ 
return
¬¬ 
$str
¬¬ M
;
¬¬M N
}
√√ 
if
≈≈ 
(
≈≈ 
!
≈≈ 
password
≈≈ 
.
≈≈ 
Any
≈≈ 
(
≈≈ 
char
≈≈ "
.
≈≈" #
IsDigit
≈≈# *
)
≈≈* +
)
≈≈+ ,
{
∆∆ 
return
«« 
$str
«« C
;
««C D
}
»» 
if
   
(
   
!
   
password
   
.
   
Any
   
(
   
ch
    
=>
  ! #
!
  $ %
char
  % )
.
  ) *
IsLetterOrDigit
  * 9
(
  9 :
ch
  : <
)
  < =
)
  = >
)
  > ?
{
ÀÀ 
return
ÃÃ 
$str
ÃÃ N
;
ÃÃN O
}
ÕÕ 
return
œœ 
null
œœ 
;
œœ 
}
–– 	
private
““ 
string
““ 
GenerateToken
““ $
(
““$ %
User
““% )
user
““* .
)
““. /
{
”” 	
var
‘‘ 
jwtSettings
‘‘ 
=
‘‘ 
_configuration
‘‘ ,
.
‘‘, -

GetSection
‘‘- 7
(
‘‘7 8
$str
‘‘8 =
)
‘‘= >
;
‘‘> ?
var
÷÷ 
key
÷÷ 
=
÷÷ 
new
÷÷ "
SymmetricSecurityKey
÷÷ .
(
÷÷. /
Encoding
◊◊ 
.
◊◊ 
UTF8
◊◊ 
.
◊◊ 
GetBytes
◊◊ &
(
◊◊& '
jwtSettings
◊◊' 2
[
◊◊2 3
$str
◊◊3 8
]
◊◊8 9
!
◊◊9 :
)
◊◊: ;
)
◊◊; <
;
◊◊< =
var
ŸŸ 
credentials
ŸŸ 
=
ŸŸ 
new
ŸŸ ! 
SigningCredentials
ŸŸ" 4
(
ŸŸ4 5
key
⁄⁄ 
,
⁄⁄  
SecurityAlgorithms
€€ "
.
€€" #

HmacSha256
€€# -
)
€€- .
;
€€. /
var
›› 
claims
›› 
=
›› 
new
›› 
List
›› !
<
››! "
Claim
››" '
>
››' (
{
ﬁﬁ 
new
ﬂﬂ 
Claim
ﬂﬂ 
(
ﬂﬂ %
JwtRegisteredClaimNames
‡‡ +
.
‡‡+ ,
Sub
‡‡, /
,
‡‡/ 0
user
·· 
.
·· 
UserId
·· 
.
··  
ToString
··  (
(
··( )
)
··) *
)
··* +
,
··+ ,
new
„„ 
Claim
„„ 
(
„„ %
JwtRegisteredClaimNames
‰‰ +
.
‰‰+ ,
Email
‰‰, 1
,
‰‰1 2
user
ÂÂ 
.
ÂÂ 
Email
ÂÂ 
)
ÂÂ 
,
ÂÂ  
new
ÁÁ 
Claim
ÁÁ 
(
ÁÁ %
JwtRegisteredClaimNames
ËË +
.
ËË+ ,
Jti
ËË, /
,
ËË/ 0
Guid
ÈÈ 
.
ÈÈ 
NewGuid
ÈÈ  
(
ÈÈ  !
)
ÈÈ! "
.
ÈÈ" #
ToString
ÈÈ# +
(
ÈÈ+ ,
)
ÈÈ, -
)
ÈÈ- .
,
ÈÈ. /
new
ÎÎ 
Claim
ÎÎ 
(
ÎÎ 

ClaimTypes
ÏÏ 
.
ÏÏ 
NameIdentifier
ÏÏ -
,
ÏÏ- .
user
ÌÌ 
.
ÌÌ 
UserId
ÌÌ 
.
ÌÌ  
ToString
ÌÌ  (
(
ÌÌ( )
)
ÌÌ) *
)
ÌÌ* +
,
ÌÌ+ ,
new
ÔÔ 
Claim
ÔÔ 
(
ÔÔ 

ClaimTypes
 
.
 
Role
 #
,
# $
user
ÒÒ 
.
ÒÒ 
Role
ÒÒ 
.
ÒÒ 
ToString
ÒÒ &
(
ÒÒ& '
)
ÒÒ' (
)
ÒÒ( )
,
ÒÒ) *
new
ÛÛ 
Claim
ÛÛ 
(
ÛÛ 
$str
ÙÙ !
,
ÙÙ! "
user
ıı 
.
ıı 
ReferenceId
ıı $
?
ıı$ %
.
ıı% &
ToString
ıı& .
(
ıı. /
)
ıı/ 0
??
ıı1 3
string
ıı4 :
.
ıı: ;
Empty
ıı; @
)
ıı@ A
,
ııA B
new
˜˜ 
Claim
˜˜ 
(
˜˜ 
$str
¯¯ (
,
¯¯( )
user
˘˘ 
.
˘˘  
MustChangePassword
˘˘ +
.
˘˘+ ,
ToString
˘˘, 4
(
˘˘4 5
)
˘˘5 6
)
˘˘6 7
}
˙˙ 
;
˙˙ 
var
¸¸ 
token
¸¸ 
=
¸¸ 
new
¸¸ 
JwtSecurityToken
¸¸ ,
(
¸¸, -
issuer
˝˝ 
:
˝˝ 
jwtSettings
˝˝ #
[
˝˝# $
$str
˝˝$ ,
]
˝˝, -
,
˝˝- .
audience
˛˛ 
:
˛˛ 
jwtSettings
˛˛ %
[
˛˛% &
$str
˛˛& 0
]
˛˛0 1
,
˛˛1 2
claims
ˇˇ 
:
ˇˇ 
claims
ˇˇ 
,
ˇˇ 
expires
ÄÄ 
:
ÄÄ 
DateTime
ÄÄ !
.
ÄÄ! "
UtcNow
ÄÄ" (
.
ÄÄ( )

AddMinutes
ÄÄ) 3
(
ÄÄ3 4
int
ÅÅ 
.
ÅÅ 
Parse
ÅÅ 
(
ÅÅ 
jwtSettings
ÅÅ )
[
ÅÅ) *
$str
ÅÅ* H
]
ÅÅH I
!
ÅÅI J
)
ÅÅJ K
)
ÅÅK L
,
ÅÅL M 
signingCredentials
ÇÇ "
:
ÇÇ" #
credentials
ÇÇ$ /
)
ÇÇ/ 0
;
ÇÇ0 1
return
ÑÑ 
new
ÑÑ %
JwtSecurityTokenHandler
ÑÑ .
(
ÑÑ. /
)
ÑÑ/ 0
.
ÖÖ 

WriteToken
ÖÖ 
(
ÖÖ 
token
ÖÖ !
)
ÖÖ! "
;
ÖÖ" #
}
ÜÜ 	
private
àà 
static
àà 
string
àà "
GenerateRefreshToken
àà 2
(
àà2 3
)
àà3 4
{
ââ 	
return
ää 
Convert
ää 
.
ää 
ToBase64String
ää )
(
ää) *#
RandomNumberGenerator
ãã %
.
ãã% &
GetBytes
ãã& .
(
ãã. /
$num
ãã/ 1
)
ãã1 2
)
ãã2 3
;
ãã3 4
}
åå 	
}
çç 
}éé ˆ±
lC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Services\Implementation\AppointmentService.cs
	namespace 	
S4_HealthAxisApi
 
. 
Services #
.# $
Implementation$ 2
{ 
public 

class 
AppointmentService #
:$ %
IAppointmentService& 9
{ 
private 
readonly "
IAppointmentRepository /"
_appointmentRepository0 F
;F G
private 
readonly 
IPatientRepository +
_patientRepository, >
;> ?
private 
readonly 
IDoctorRepository *
_doctorRepository+ <
;< =
private 
readonly 
IPublishEndpoint )
_publishEndpoint* :
;: ;
private 
readonly 
ILogger  
<  !
AppointmentService! 3
>3 4
_logger5 <
;< =
private 
readonly 
IDistributedCache *
_cache+ 1
;1 2
public 
AppointmentService !
(! ""
IAppointmentRepository "!
appointmentRepository# 8
,8 9
IPatientRepository 
patientRepository 0
,0 1
IDoctorRepository 
doctorRepository .
,. /
IPublishEndpoint 
publishEndpoint ,
,, -
ILogger 
< 
AppointmentService &
>& '
logger( .
,. /
IDistributedCache 
cache #
)# $
{ 	"
_appointmentRepository "
=# $!
appointmentRepository% :
;: ;
_patientRepository 
=  
patientRepository! 2
;2 3
_doctorRepository   
=   
doctorRepository    0
;  0 1
_publishEndpoint!! 
=!! 
publishEndpoint!! .
;!!. /
_logger"" 
="" 
logger"" 
;"" 
_cache## 
=## 
cache## 
;## 
}$$ 	
public&& 
async&& 
Task&& 
<&& 
IEnumerable&& %
<&&% &!
AppointmentDetailsDto&&& ;
>&&; <
>&&< =
GetAllAsync&&> I
(&&I J
)&&J K
{'' 	
var(( 
appointments(( 
=(( 
await)) "
_appointmentRepository)) ,
.)), -
GetAllAsync))- 8
())8 9
)))9 :
;)): ;
return++ 
appointments++ 
.++  
Select++  &
(++& '&
MapToAppointmentDetailsDto++' A
)++A B
;++B C
},, 	
public.. 
async.. 
Task.. 
<.. !
AppointmentDetailsDto.. /
?../ 0
>..0 1
GetByIdAsync..2 >
(..> ?
int..? B
id..C E
)..E F
{// 	
var00 
appointment00 
=00 
await11 "
_appointmentRepository11 ,
.11, -
GetByIdAsync11- 9
(119 :
id11: <
)11< =
;11= >
if33 
(33 
appointment33 
==33 
null33 #
)33# $
{44 
return55 
null55 
;55 
}66 
return88 &
MapToAppointmentDetailsDto88 -
(88- .
appointment88. 9
)889 :
;88: ;
}99 	
public;; 
async;; 
Task;; 
<;; 
IEnumerable;; %
<;;% &(
PatientAppointmentHistoryDto;;& B
>;;B C
>;;C D"
GetPatientHistoryAsync;;E [
(;;[ \
int<< 
	patientId<< 
)<< 
{== 	
var>> 
appointments>> 
=>> 
await?? "
_appointmentRepository?? ,
.??, -
GetByPatientIdAsync??- @
(??@ A
	patientId??A J
)??J K
;??K L
returnAA 
appointmentsAA 
.AA  
SelectAA  &
(AA& '
aAA' (
=>AA) +
newAA, /(
PatientAppointmentHistoryDtoAA0 L
{BB 
AppointmentIdCC 
=CC 
aCC  !
.CC! "
AppointmentIdCC" /
,CC/ 0
ScheduledDateDD 
=DD 
aDD  !
.DD! "
ScheduledDateDD" /
,DD/ 0
TimeSlotEE 
=EE 
(EE 
intEE 
)EE  
aEE  !
.EE! "
TimeSlotEE" *
,EE* +
DoctorIdFF 
=FF 
aFF 
.FF 
DoctorIdFF %
,FF% &

DoctorNameGG 
=GG 
aGG 
.GG 
DoctorGG %
.GG% &
FullNameGG& .
,GG. /
StatusHH 
=HH 
(HH 
intHH 
)HH 
aHH 
.HH  
StatusHH  &
}II 
)II 
;II 
}JJ 	
publicLL 
asyncLL 
TaskLL 
<LL 
IEnumerableLL %
<LL% &!
DoctorScheduleItemDtoLL& ;
>LL; <
>LL< ='
GetDoctorTodayScheduleAsyncLL> Y
(LLY Z
intMM 
doctorIdMM 
)MM 
{NN 	
varOO 
appointmentsOO 
=OO 
awaitPP "
_appointmentRepositoryPP ,
.PP, -'
GetDoctorTodayScheduleAsyncPP- H
(PPH I
doctorIdQQ 
,QQ 
DateOnlyRR 
.RR 
FromDateTimeRR )
(RR) *
DateTimeRR* 2
.RR2 3
TodayRR3 8
)RR8 9
)RR9 :
;RR: ;
returnTT 
appointmentsTT 
.TT  
SelectTT  &
(TT& '!
MapDoctorScheduleItemTT' <
)TT< =
;TT= >
}UU 	
publicWW 
asyncWW 
TaskWW 
<WW 
IEnumerableWW %
<WW% &!
DoctorScheduleItemDtoWW& ;
>WW; <
>WW< =&
GetDoctorWeekScheduleAsyncWW> X
(WWX Y
intXX 
doctorIdXX 
,XX 
DateOnlyYY 
	startDateYY 
,YY 
DateOnlyZZ 
endDateZZ 
)ZZ 
{[[ 	
var\\ 
appointments\\ 
=\\ 
await]] "
_appointmentRepository]] ,
.]], -&
GetDoctorWeekScheduleAsync]]- G
(]]G H
doctorId^^ 
,^^ 
	startDate__ 
,__ 
endDate`` 
)`` 
;`` 
returnbb 
appointmentsbb 
.bb  
Selectbb  &
(bb& '!
MapDoctorScheduleItembb' <
)bb< =
;bb= >
}cc 	
publicee 
asyncee 
Taskee 
<ee 
AppointmentDtoee (
>ee( )
CreateAsyncee* 5
(ee5 6 
CreateAppointmentDtoee6 J
dtoeeK N
)eeN O
{ff 	
awaitgg  
ValidateBookingAsyncgg &
(gg& '
dtohh 
.hh 
	PatientIdhh 
,hh 
dtoii 
.ii 
DoctorIdii 
,ii 
dtojj 
.jj 
ScheduledDatejj !
,jj! "
dtokk 
.kk 
TimeSlotkk 
)kk 
;kk 
varmm 
appointmentmm 
=mm 
newmm !
Appointmentmm" -
{nn 
	PatientIdoo 
=oo 
dtooo 
.oo  
	PatientIdoo  )
,oo) *
DoctorIdpp 
=pp 
dtopp 
.pp 
DoctorIdpp '
,pp' (
ScheduledDateqq 
=qq 
dtoqq  #
.qq# $
ScheduledDateqq$ 1
,qq1 2
TimeSlotrr 
=rr 
(rr 
AppointmentTimeSlotrr /
)rr/ 0
dtorr0 3
.rr3 4
TimeSlotrr4 <
,rr< =
Statusss 
=ss 
AppointmentStatusss *
.ss* +
Pendingss+ 2
}tt 
;tt 
awaitvv "
_appointmentRepositoryvv (
.vv( )
AddAsyncvv) 1
(vv1 2
appointmentvv2 =
)vv= >
;vv> ?
awaitww "
_appointmentRepositoryww (
.ww( )
SaveChangesAsyncww) 9
(ww9 :
)ww: ;
;ww; <
awaityy 2
&InvalidateDoctorAvailabilityCacheAsyncyy 8
(yy8 9
appointmentzz 
.zz 
DoctorIdzz $
,zz$ %
appointment{{ 
.{{ 
ScheduledDate{{ )
,{{) *
appointment|| 
.|| 
AppointmentId|| )
)||) *
;||* +
var~~ 
patient~~ 
=~~ 
await 
_patientRepository (
.( )
GetByIdAsync) 5
(5 6
dto6 9
.9 :
	PatientId: C
)C D
;D E
var
ÅÅ $
appointmentBookedEvent
ÅÅ &
=
ÅÅ' (
new
ÅÅ) ,$
AppointmentBookedEvent
ÅÅ- C
{
ÇÇ 
AppointmentId
ÉÉ 
=
ÉÉ 
appointment
ÉÉ  +
.
ÉÉ+ ,
AppointmentId
ÉÉ, 9
,
ÉÉ9 :
PatientName
ÑÑ 
=
ÑÑ 
patient
ÑÑ %
?
ÑÑ% &
.
ÑÑ& '
FullName
ÑÑ' /
??
ÑÑ0 2
$str
ÑÑ3 <
,
ÑÑ< =
DoctorId
ÖÖ 
=
ÖÖ 
appointment
ÖÖ &
.
ÖÖ& '
DoctorId
ÖÖ' /
,
ÖÖ/ 0
ScheduledDate
ÜÜ 
=
ÜÜ 
appointment
ÜÜ  +
.
ÜÜ+ ,
ScheduledDate
ÜÜ, 9
,
ÜÜ9 :
TimeSlot
áá 
=
áá 
appointment
áá &
.
áá& '
TimeSlot
áá' /
.
áá/ 0
ToString
áá0 8
(
áá8 9
)
áá9 :
}
àà 
;
àà 
_logger
ää 
.
ää 
LogInformation
ää "
(
ää" #
$str
ãò 
,
òò 
nameof
ôô 
(
ôô $
AppointmentBookedEvent
ôô -
)
ôô- .
,
ôô. /$
appointmentBookedEvent
öö &
.
öö& '
AppointmentId
öö' 4
,
öö4 5$
appointmentBookedEvent
õõ &
.
õõ& '
PatientName
õõ' 2
,
õõ2 3$
appointmentBookedEvent
úú &
.
úú& '
DoctorId
úú' /
,
úú/ 0$
appointmentBookedEvent
ùù &
.
ùù& '
ScheduledDate
ùù' 4
,
ùù4 5$
appointmentBookedEvent
ûû &
.
ûû& '
TimeSlot
ûû' /
)
ûû/ 0
;
ûû0 1
await
†† 
_publishEndpoint
†† "
.
††" #
Publish
††# *
(
††* +$
appointmentBookedEvent
††+ A
)
††A B
;
††B C
_logger
¢¢ 
.
¢¢ 
LogInformation
¢¢ "
(
¢¢" #
$str
£≠ 
,
≠≠ 
nameof
ÆÆ 
(
ÆÆ $
AppointmentBookedEvent
ÆÆ -
)
ÆÆ- .
,
ÆÆ. /$
appointmentBookedEvent
ØØ &
.
ØØ& '
AppointmentId
ØØ' 4
,
ØØ4 5$
appointmentBookedEvent
∞∞ &
.
∞∞& '
DoctorId
∞∞' /
)
∞∞/ 0
;
∞∞0 1
_logger
≤≤ 
.
≤≤ 
LogInformation
≤≤ "
(
≤≤" #
$str
≥¿ 
,
¿¿ 
appointment
¡¡ 
.
¡¡ 
AppointmentId
¡¡ )
,
¡¡) *
appointment
¬¬ 
.
¬¬ 
	PatientId
¬¬ %
,
¬¬% &
appointment
√√ 
.
√√ 
DoctorId
√√ $
,
√√$ %
appointment
ƒƒ 
.
ƒƒ 
ScheduledDate
ƒƒ )
,
ƒƒ) *
appointment
≈≈ 
.
≈≈ 
TimeSlot
≈≈ $
,
≈≈$ %
appointment
∆∆ 
.
∆∆ 
Status
∆∆ "
)
∆∆" #
;
∆∆# $
return
»» !
MapToAppointmentDto
»» &
(
»»& '
appointment
»»' 2
)
»»2 3
;
»»3 4
}
…… 	
public
ÀÀ 
async
ÀÀ 
Task
ÀÀ 
UpdateAsync
ÀÀ %
(
ÀÀ% &
int
ÃÃ 
id
ÃÃ 
,
ÃÃ "
UpdateAppointmentDto
ÕÕ  
dto
ÕÕ! $
)
ÕÕ$ %
{
ŒŒ 	
var
œœ 
appointment
œœ 
=
œœ 
await
–– $
_appointmentRepository
–– ,
.
––, -
GetByIdAsync
––- 9
(
––9 :
id
––: <
)
––< =
;
––= >
if
““ 
(
““ 
appointment
““ 
==
““ 
null
““ #
)
““# $
{
”” 
throw
‘‘ 
new
‘‘ "
KeyNotFoundException
‘‘ .
(
‘‘. /
$"
’’ 
$str
’’ "
{
’’" #
id
’’# %
}
’’% &
$str
’’& 1
"
’’1 2
)
’’2 3
;
’’3 4
}
÷÷ 
if
ÿÿ 
(
ÿÿ 
appointment
ÿÿ 
.
ÿÿ 
Status
ÿÿ "
==
ÿÿ# %
AppointmentStatus
ÿÿ& 7
.
ÿÿ7 8
	Completed
ÿÿ8 A
)
ÿÿA B
{
ŸŸ 
throw
⁄⁄ 
new
⁄⁄ '
InvalidOperationException
⁄⁄ 3
(
⁄⁄3 4
$str
€€ @
)
€€@ A
;
€€A B
}
‹‹ 
if
ﬁﬁ 
(
ﬁﬁ 
appointment
ﬁﬁ 
.
ﬁﬁ 
Status
ﬁﬁ "
==
ﬁﬁ# %
AppointmentStatus
ﬁﬁ& 7
.
ﬁﬁ7 8
	Cancelled
ﬁﬁ8 A
)
ﬁﬁA B
{
ﬂﬂ 
throw
‡‡ 
new
‡‡ '
InvalidOperationException
‡‡ 3
(
‡‡3 4
$str
·· @
)
··@ A
;
··A B
}
‚‚ 
await
‰‰ (
ValidateUpdateBookingAsync
‰‰ ,
(
‰‰, -
appointment
ÂÂ 
.
ÂÂ 
AppointmentId
ÂÂ )
,
ÂÂ) *
appointment
ÊÊ 
.
ÊÊ 
	PatientId
ÊÊ %
,
ÊÊ% &
dto
ÁÁ 
.
ÁÁ 
DoctorId
ÁÁ 
,
ÁÁ 
dto
ËË 
.
ËË 
ScheduledDate
ËË !
,
ËË! "
dto
ÈÈ 
.
ÈÈ 
TimeSlot
ÈÈ 
)
ÈÈ 
;
ÈÈ 
var
ÎÎ 
oldDoctorId
ÎÎ 
=
ÎÎ 
appointment
ÏÏ 
.
ÏÏ 
DoctorId
ÏÏ $
;
ÏÏ$ %
var
ÓÓ 
oldScheduledDate
ÓÓ  
=
ÓÓ! "
appointment
ÔÔ 
.
ÔÔ 
ScheduledDate
ÔÔ )
;
ÔÔ) *
appointment
ÒÒ 
.
ÒÒ 
DoctorId
ÒÒ  
=
ÒÒ! "
dto
ÒÒ# &
.
ÒÒ& '
DoctorId
ÒÒ' /
;
ÒÒ/ 0
appointment
ÚÚ 
.
ÚÚ 
ScheduledDate
ÚÚ %
=
ÚÚ& '
dto
ÚÚ( +
.
ÚÚ+ ,
ScheduledDate
ÚÚ, 9
;
ÚÚ9 :
appointment
ÛÛ 
.
ÛÛ 
TimeSlot
ÛÛ  
=
ÛÛ! "
(
ÛÛ# $!
AppointmentTimeSlot
ÛÛ$ 7
)
ÛÛ7 8
dto
ÛÛ8 ;
.
ÛÛ; <
TimeSlot
ÛÛ< D
;
ÛÛD E
await
ıı $
_appointmentRepository
ıı (
.
ıı( )
UpdateAsync
ıı) 4
(
ıı4 5
appointment
ıı5 @
)
ıı@ A
;
ııA B
await
ˆˆ $
_appointmentRepository
ˆˆ (
.
ˆˆ( )
SaveChangesAsync
ˆˆ) 9
(
ˆˆ9 :
)
ˆˆ: ;
;
ˆˆ; <
await
¯¯ 4
&InvalidateDoctorAvailabilityCacheAsync
¯¯ 8
(
¯¯8 9
oldDoctorId
˘˘ 
,
˘˘ 
oldScheduledDate
˙˙  
,
˙˙  !
appointment
˚˚ 
.
˚˚ 
AppointmentId
˚˚ )
)
˚˚) *
;
˚˚* +
await
˝˝ 4
&InvalidateDoctorAvailabilityCacheAsync
˝˝ 8
(
˝˝8 9
appointment
˛˛ 
.
˛˛ 
DoctorId
˛˛ $
,
˛˛$ %
appointment
ˇˇ 
.
ˇˇ 
ScheduledDate
ˇˇ )
,
ˇˇ) *
appointment
ÄÄ 
.
ÄÄ 
AppointmentId
ÄÄ )
)
ÄÄ) *
;
ÄÄ* +
}
ÅÅ 	
public
ÉÉ 
async
ÉÉ 
Task
ÉÉ 
UpdateStatusAsync
ÉÉ +
(
ÉÉ+ ,
int
ÑÑ 
id
ÑÑ 
,
ÑÑ (
UpdateAppointmentStatusDto
ÖÖ &
dto
ÖÖ' *
)
ÖÖ* +
{
ÜÜ 	
var
áá 
appointment
áá 
=
áá 
await
àà $
_appointmentRepository
àà ,
.
àà, -
GetByIdAsync
àà- 9
(
àà9 :
id
àà: <
)
àà< =
;
àà= >
if
ää 
(
ää 
appointment
ää 
==
ää 
null
ää #
)
ää# $
{
ãã 
throw
åå 
new
åå "
KeyNotFoundException
åå .
(
åå. /
$"
çç 
$str
çç "
{
çç" #
id
çç# %
}
çç% &
$str
çç& 1
"
çç1 2
)
çç2 3
;
çç3 4
}
éé 
if
êê 
(
êê 
!
êê 
Enum
êê 
.
êê 
	IsDefined
êê 
(
êê  
typeof
êê  &
(
êê& '
AppointmentStatus
êê' 8
)
êê8 9
,
êê9 :
dto
êê; >
.
êê> ?
Status
êê? E
)
êêE F
)
êêF G
{
ëë 
throw
íí 
new
íí 
ArgumentException
íí +
(
íí+ ,
$str
ìì 1
)
ìì1 2
;
ìì2 3
}
îî 
var
ññ 
	newStatus
ññ 
=
ññ 
(
óó 
AppointmentStatus
óó "
)
óó" #
dto
óó# &
.
óó& '
Status
óó' -
;
óó- .
var
ôô /
!shouldInvalidateAvailabilityCache
ôô 1
=
ôô2 3
false
öö 
;
öö 
if
úú 
(
úú 
appointment
úú 
.
úú 
Status
úú "
==
úú# %
AppointmentStatus
úú& 7
.
úú7 8
	Completed
úú8 A
)
úúA B
{
ùù 
throw
ûû 
new
ûû '
InvalidOperationException
ûû 3
(
ûû3 4
$str
üü @
)
üü@ A
;
üüA B
}
†† 
if
¢¢ 
(
¢¢ 
appointment
¢¢ 
.
¢¢ 
Status
¢¢ "
==
¢¢# %
AppointmentStatus
¢¢& 7
.
¢¢7 8
	Cancelled
¢¢8 A
)
¢¢A B
{
££ 
throw
§§ 
new
§§ '
InvalidOperationException
§§ 3
(
§§3 4
$str
•• @
)
••@ A
;
••A B
}
¶¶ 
switch
®® 
(
®® 
	newStatus
®® 
)
®® 
{
©© 
case
™™ 
AppointmentStatus
™™ &
.
™™& '
Pending
™™' .
:
™™. /
throw
´´ 
new
´´ '
InvalidOperationException
´´ 7
(
´´7 8
$str
¨¨ M
)
¨¨M N
;
¨¨N O
case
ÆÆ 
AppointmentStatus
ÆÆ &
.
ÆÆ& '
	Confirmed
ÆÆ' 0
:
ÆÆ0 1
if
ØØ 
(
ØØ 
appointment
ØØ #
.
ØØ# $
Status
ØØ$ *
!=
ØØ+ -
AppointmentStatus
ØØ. ?
.
ØØ? @
Pending
ØØ@ G
)
ØØG H
{
∞∞ 
throw
±± 
new
±± !'
InvalidOperationException
±±" ;
(
±±; <
$str
≤≤ I
)
≤≤I J
;
≤≤J K
}
≥≥ 
appointment
µµ 
.
µµ  
Status
µµ  &
=
µµ' (
AppointmentStatus
∂∂ )
.
∂∂) *
	Confirmed
∂∂* 3
;
∂∂3 4
break
∏∏ 
;
∏∏ 
case
∫∫ 
AppointmentStatus
∫∫ &
.
∫∫& '
	Completed
∫∫' 0
:
∫∫0 1
if
ªª 
(
ªª 
appointment
ªª #
.
ªª# $
Status
ªª$ *
!=
ªª+ -
AppointmentStatus
ªª. ?
.
ªª? @
	Confirmed
ªª@ I
)
ªªI J
{
ºº 
throw
ΩΩ 
new
ΩΩ !'
InvalidOperationException
ΩΩ" ;
(
ΩΩ; <
$str
ææ K
)
ææK L
;
ææL M
}
øø 
appointment
¡¡ 
.
¡¡  
Status
¡¡  &
=
¡¡' (
AppointmentStatus
¬¬ )
.
¬¬) *
	Completed
¬¬* 3
;
¬¬3 4
break
ƒƒ 
;
ƒƒ 
case
∆∆ 
AppointmentStatus
∆∆ &
.
∆∆& '
	Cancelled
∆∆' 0
:
∆∆0 1
if
«« 
(
«« 
string
«« 
.
««  
IsNullOrWhiteSpace
«« 1
(
««1 2
dto
««2 5
.
««5 6 
CancellationReason
««6 H
)
««H I
)
««I J
{
»» 
throw
…… 
new
…… !
ArgumentException
……" 3
(
……3 4
$str
   >
)
  > ?
;
  ? @
}
ÀÀ 
appointment
ÕÕ 
.
ÕÕ  
Status
ÕÕ  &
=
ÕÕ' (
AppointmentStatus
ŒŒ )
.
ŒŒ) *
	Cancelled
ŒŒ* 3
;
ŒŒ3 4
appointment
–– 
.
––   
CancellationReason
––  2
=
––3 4
dto
—— 
.
——  
CancellationReason
—— .
.
——. /
Trim
——/ 3
(
——3 4
)
——4 5
;
——5 6/
!shouldInvalidateAvailabilityCache
”” 5
=
””6 7
true
‘‘ 
;
‘‘ 
break
÷÷ 
;
÷÷ 
default
ÿÿ 
:
ÿÿ 
throw
ŸŸ 
new
ŸŸ 
ArgumentException
ŸŸ /
(
ŸŸ/ 0
$str
⁄⁄ 5
)
⁄⁄5 6
;
⁄⁄6 7
}
€€ 
await
›› $
_appointmentRepository
›› (
.
››( )
UpdateAsync
››) 4
(
››4 5
appointment
››5 @
)
››@ A
;
››A B
await
ﬁﬁ $
_appointmentRepository
ﬁﬁ (
.
ﬁﬁ( )
SaveChangesAsync
ﬁﬁ) 9
(
ﬁﬁ9 :
)
ﬁﬁ: ;
;
ﬁﬁ; <
if
‡‡ 
(
‡‡ /
!shouldInvalidateAvailabilityCache
‡‡ 1
)
‡‡1 2
{
·· 
await
‚‚ 4
&InvalidateDoctorAvailabilityCacheAsync
‚‚ <
(
‚‚< =
appointment
„„ 
.
„„  
DoctorId
„„  (
,
„„( )
appointment
‰‰ 
.
‰‰  
ScheduledDate
‰‰  -
,
‰‰- .
appointment
ÂÂ 
.
ÂÂ  
AppointmentId
ÂÂ  -
)
ÂÂ- .
;
ÂÂ. /
}
ÊÊ 
}
ÁÁ 	
public
ÈÈ 
async
ÈÈ 
Task
ÈÈ 
ConfirmAsync
ÈÈ &
(
ÈÈ& '
int
ÈÈ' *
id
ÈÈ+ -
)
ÈÈ- .
{
ÍÍ 	
var
ÎÎ 
appointment
ÎÎ 
=
ÎÎ 
await
ÏÏ $
_appointmentRepository
ÏÏ ,
.
ÏÏ, -
GetByIdAsync
ÏÏ- 9
(
ÏÏ9 :
id
ÏÏ: <
)
ÏÏ< =
;
ÏÏ= >
if
ÓÓ 
(
ÓÓ 
appointment
ÓÓ 
==
ÓÓ 
null
ÓÓ #
)
ÓÓ# $
{
ÔÔ 
throw
 
new
 "
KeyNotFoundException
 .
(
. /
)
/ 0
;
0 1
}
ÒÒ 
if
ÛÛ 
(
ÛÛ 
appointment
ÛÛ 
.
ÛÛ 
Status
ÛÛ "
!=
ÛÛ# %
AppointmentStatus
ÛÛ& 7
.
ÛÛ7 8
Pending
ÛÛ8 ?
)
ÛÛ? @
{
ÙÙ 
throw
ıı 
new
ıı '
InvalidOperationException
ıı 3
(
ıı3 4
$str
ˆˆ A
)
ˆˆA B
;
ˆˆB C
}
˜˜ 
appointment
˘˘ 
.
˘˘ 
Status
˘˘ 
=
˘˘  
AppointmentStatus
˙˙ !
.
˙˙! "
	Confirmed
˙˙" +
;
˙˙+ ,
await
¸¸ $
_appointmentRepository
¸¸ (
.
¸¸( )
UpdateAsync
¸¸) 4
(
¸¸4 5
appointment
¸¸5 @
)
¸¸@ A
;
¸¸A B
await
˝˝ $
_appointmentRepository
˝˝ (
.
˝˝( )
SaveChangesAsync
˝˝) 9
(
˝˝9 :
)
˝˝: ;
;
˝˝; <
}
˛˛ 	
public
ÄÄ 
async
ÄÄ 
Task
ÄÄ 
CompleteAsync
ÄÄ '
(
ÄÄ' (
int
ÄÄ( +
id
ÄÄ, .
)
ÄÄ. /
{
ÅÅ 	
var
ÇÇ 
appointment
ÇÇ 
=
ÇÇ 
await
ÉÉ $
_appointmentRepository
ÉÉ ,
.
ÉÉ, -
GetByIdAsync
ÉÉ- 9
(
ÉÉ9 :
id
ÉÉ: <
)
ÉÉ< =
;
ÉÉ= >
if
ÖÖ 
(
ÖÖ 
appointment
ÖÖ 
==
ÖÖ 
null
ÖÖ #
)
ÖÖ# $
{
ÜÜ 
throw
áá 
new
áá "
KeyNotFoundException
áá .
(
áá. /
)
áá/ 0
;
áá0 1
}
àà 
if
ää 
(
ää 
appointment
ää 
.
ää 
Status
ää "
!=
ää# %
AppointmentStatus
ää& 7
.
ää7 8
	Confirmed
ää8 A
)
ääA B
{
ãã 
throw
åå 
new
åå '
InvalidOperationException
åå 3
(
åå3 4
$str
çç C
)
ççC D
;
ççD E
}
éé 
appointment
êê 
.
êê 
Status
êê 
=
êê  
AppointmentStatus
ëë !
.
ëë! "
	Completed
ëë" +
;
ëë+ ,
await
ìì $
_appointmentRepository
ìì (
.
ìì( )
UpdateAsync
ìì) 4
(
ìì4 5
appointment
ìì5 @
)
ìì@ A
;
ììA B
await
îî $
_appointmentRepository
îî (
.
îî( )
SaveChangesAsync
îî) 9
(
îî9 :
)
îî: ;
;
îî; <
}
ïï 	
public
óó 
async
óó 
Task
óó 
CancelAsync
óó %
(
óó% &
int
òò 
id
òò 
,
òò "
CancelAppointmentDto
ôô  
dto
ôô! $
)
ôô$ %
{
öö 	
var
õõ 
appointment
õõ 
=
õõ 
await
úú $
_appointmentRepository
úú ,
.
úú, -
GetByIdAsync
úú- 9
(
úú9 :
id
úú: <
)
úú< =
;
úú= >
if
ûû 
(
ûû 
appointment
ûû 
==
ûû 
null
ûû #
)
ûû# $
{
üü 
throw
†† 
new
†† "
KeyNotFoundException
†† .
(
††. /
)
††/ 0
;
††0 1
}
°° 
if
££ 
(
££ 
appointment
££ 
.
££ 
Status
££ "
==
££# %
AppointmentStatus
££& 7
.
££7 8
	Completed
££8 A
)
££A B
{
§§ 
throw
•• 
new
•• '
InvalidOperationException
•• 3
(
••3 4
$str
¶¶ A
)
¶¶A B
;
¶¶B C
}
ßß 
if
©© 
(
©© 
appointment
©© 
.
©© 
Status
©© "
==
©©# %
AppointmentStatus
©©& 7
.
©©7 8
	Cancelled
©©8 A
)
©©A B
{
™™ 
throw
´´ 
new
´´ '
InvalidOperationException
´´ 3
(
´´3 4
$str
¨¨ 4
)
¨¨4 5
;
¨¨5 6
}
≠≠ 
if
ØØ 
(
ØØ 
string
ØØ 
.
ØØ  
IsNullOrWhiteSpace
ØØ )
(
ØØ) *
dto
ØØ* -
.
ØØ- . 
CancellationReason
ØØ. @
)
ØØ@ A
)
ØØA B
{
∞∞ 
throw
±± 
new
±± 
ArgumentException
±± +
(
±±+ ,
$str
≤≤ 6
)
≤≤6 7
;
≤≤7 8
}
≥≥ 
appointment
µµ 
.
µµ 
Status
µµ 
=
µµ  
AppointmentStatus
∂∂ !
.
∂∂! "
	Cancelled
∂∂" +
;
∂∂+ ,
appointment
∏∏ 
.
∏∏  
CancellationReason
∏∏ *
=
∏∏+ ,
dto
ππ 
.
ππ  
CancellationReason
ππ &
.
ππ& '
Trim
ππ' +
(
ππ+ ,
)
ππ, -
;
ππ- .
await
ªª $
_appointmentRepository
ªª (
.
ªª( )
UpdateAsync
ªª) 4
(
ªª4 5
appointment
ªª5 @
)
ªª@ A
;
ªªA B
await
ºº $
_appointmentRepository
ºº (
.
ºº( )
SaveChangesAsync
ºº) 9
(
ºº9 :
)
ºº: ;
;
ºº; <
await
ææ 4
&InvalidateDoctorAvailabilityCacheAsync
ææ 8
(
ææ8 9
appointment
øø 
.
øø 
DoctorId
øø $
,
øø$ %
appointment
¿¿ 
.
¿¿ 
ScheduledDate
¿¿ )
,
¿¿) *
appointment
¡¡ 
.
¡¡ 
AppointmentId
¡¡ )
)
¡¡) *
;
¡¡* +
}
¬¬ 	
public
ƒƒ 
async
ƒƒ 
Task
ƒƒ 
<
ƒƒ 
IEnumerable
ƒƒ %
<
ƒƒ% &#
DoctorScheduleItemDto
ƒƒ& ;
>
ƒƒ; <
>
ƒƒ< =,
GetDoctorUpcomingScheduleAsync
ƒƒ> \
(
ƒƒ\ ]
int
≈≈ 
doctorId
≈≈ 
)
≈≈ 
{
∆∆ 	
var
«« 
	startDate
«« 
=
«« 
DateOnly
»» 
.
»» 
FromDateTime
»» %
(
»»% &
DateTime
»»& .
.
»». /
Today
»»/ 4
)
»»4 5
;
»»5 6
var
   
endDate
   
=
   
	startDate
ÀÀ 
.
ÀÀ 
AddDays
ÀÀ !
(
ÀÀ! "
$num
ÀÀ" #
)
ÀÀ# $
;
ÀÀ$ %
var
ÕÕ 
appointments
ÕÕ 
=
ÕÕ 
await
ŒŒ $
_appointmentRepository
ŒŒ ,
.
ŒŒ, -(
GetDoctorWeekScheduleAsync
ŒŒ- G
(
ŒŒG H
doctorId
œœ 
,
œœ 
	startDate
–– 
,
–– 
endDate
—— 
)
—— 
;
—— 
return
”” 
appointments
”” 
.
””  
Select
””  &
(
””& '#
MapDoctorScheduleItem
””' <
)
””< =
;
””= >
}
‘‘ 	
public
÷÷ 
async
÷÷ 
Task
÷÷ 
<
÷÷ 
IEnumerable
÷÷ %
<
÷÷% &
DoctorPatientDto
÷÷& 6
>
÷÷6 7
>
÷÷7 8$
GetDoctorPatientsAsync
÷÷9 O
(
÷÷O P
int
◊◊ 
doctorId
◊◊ 
)
◊◊ 
{
ÿÿ 	
var
ŸŸ 
doctor
ŸŸ 
=
ŸŸ 
await
⁄⁄ 
_doctorRepository
⁄⁄ '
.
⁄⁄' (
GetByIdAsync
⁄⁄( 4
(
⁄⁄4 5
doctorId
⁄⁄5 =
)
⁄⁄= >
;
⁄⁄> ?
if
‹‹ 
(
‹‹ 
doctor
‹‹ 
==
‹‹ 
null
‹‹ 
)
‹‹ 
{
›› 
throw
ﬁﬁ 
new
ﬁﬁ "
KeyNotFoundException
ﬁﬁ .
(
ﬁﬁ. /
$"
ﬂﬂ 
$str
ﬂﬂ %
{
ﬂﬂ% &
doctorId
ﬂﬂ& .
}
ﬂﬂ. /
$str
ﬂﬂ/ :
"
ﬂﬂ: ;
)
ﬂﬂ; <
;
ﬂﬂ< =
}
‡‡ 
var
‚‚ 
appointments
‚‚ 
=
‚‚ 
await
„„ $
_appointmentRepository
„„ ,
.
‰‰ /
!GetDoctorPatientAppointmentsAsync
‰‰ 6
(
‰‰6 7
doctorId
‰‰7 ?
)
‰‰? @
;
‰‰@ A
var
ÊÊ 
patients
ÊÊ 
=
ÊÊ 
appointments
ÁÁ 
.
ËË 
Where
ËË 
(
ËË 
appointment
ËË &
=>
ËË' )
appointment
ËË* 5
.
ËË5 6
Patient
ËË6 =
!=
ËË> @
null
ËËA E
)
ËËE F
.
ÈÈ 
GroupBy
ÈÈ 
(
ÈÈ 
appointment
ÈÈ (
=>
ÈÈ) +
appointment
ÈÈ, 7
.
ÈÈ7 8
	PatientId
ÈÈ8 A
)
ÈÈA B
.
ÍÍ 
Select
ÍÍ 
(
ÍÍ 
group
ÍÍ !
=>
ÍÍ" $
{
ÎÎ 
var
ÏÏ 
latestAppointment
ÏÏ -
=
ÏÏ. /
group
ÌÌ !
.
ÓÓ  !
OrderByDescending
ÓÓ! 2
(
ÓÓ2 3
appointment
ÓÓ3 >
=>
ÓÓ? A
appointment
ÔÔ$ /
.
ÔÔ/ 0
ScheduledDate
ÔÔ0 =
)
ÔÔ= >
.
  !
ThenByDescending
! 1
(
1 2
appointment
2 =
=>
> @
appointment
ÒÒ$ /
.
ÒÒ/ 0
TimeSlot
ÒÒ0 8
)
ÒÒ8 9
.
ÚÚ  !
First
ÚÚ! &
(
ÚÚ& '
)
ÚÚ' (
;
ÚÚ( )
var
ÙÙ 
patient
ÙÙ #
=
ÙÙ$ %
latestAppointment
ıı -
.
ıı- .
Patient
ıı. 5
;
ıı5 6
return
˜˜ 
new
˜˜ "
DoctorPatientDto
˜˜# 3
{
¯¯ 
	PatientId
˘˘ %
=
˘˘& '
patient
˘˘( /
.
˘˘/ 0
	PatientId
˘˘0 9
,
˘˘9 :
FullName
˙˙ $
=
˙˙% &
patient
˙˙' .
.
˙˙. /
FullName
˙˙/ 7
,
˙˙7 8
DateOfBirth
˚˚ '
=
˚˚( )
patient
˚˚* 1
.
˚˚1 2
DateOfBirth
˚˚2 =
,
˚˚= >
Gender
¸¸ "
=
¸¸# $
patient
¸¸% ,
.
¸¸, -
Gender
¸¸- 3
,
¸¸3 4
PhoneNumber
˝˝ '
=
˝˝( )
patient
˝˝* 1
.
˝˝1 2
PhoneNumber
˝˝2 =
,
˝˝= >
Email
˛˛ !
=
˛˛" #
patient
˛˛$ +
.
˛˛+ ,
Email
˛˛, 1
,
˛˛1 2
InsuranceId
ˇˇ '
=
ˇˇ( )
patient
ˇˇ* 1
.
ˇˇ1 2
InsuranceNumber
ˇˇ2 A
,
ˇˇA B
IsActive
ÄÄ $
=
ÄÄ% &
patient
ÄÄ' .
.
ÄÄ. /
IsActive
ÄÄ/ 7
,
ÄÄ7 8
TotalAppointments
ÅÅ -
=
ÅÅ. /
group
ÅÅ0 5
.
ÅÅ5 6
Count
ÅÅ6 ;
(
ÅÅ; <
)
ÅÅ< =
,
ÅÅ= >
LastVisitDate
ÇÇ )
=
ÇÇ* +
latestAppointment
ÇÇ, =
.
ÇÇ= >
ScheduledDate
ÇÇ> K
}
ÉÉ 
;
ÉÉ 
}
ÑÑ 
)
ÑÑ 
.
ÖÖ 
OrderBy
ÖÖ 
(
ÖÖ 
patient
ÖÖ $
=>
ÖÖ% '
patient
ÖÖ( /
.
ÖÖ/ 0
FullName
ÖÖ0 8
)
ÖÖ8 9
.
ÜÜ 
ToList
ÜÜ 
(
ÜÜ 
)
ÜÜ 
;
ÜÜ 
return
àà 
patients
àà 
;
àà 
}
ââ 	
private
ãã 
async
ãã 
Task
ãã "
ValidateBookingAsync
ãã /
(
ãã/ 0
int
åå 
	patientId
åå 
,
åå 
int
çç 
doctorId
çç 
,
çç 
DateOnly
éé 
date
éé 
,
éé 
int
èè 
timeSlot
èè 
)
èè 
{
êê 	
var
ëë 
patient
ëë 
=
ëë 
await
íí  
_patientRepository
íí (
.
íí( )
GetByIdAsync
íí) 5
(
íí5 6
	patientId
íí6 ?
)
íí? @
;
íí@ A
if
îî 
(
îî 
patient
îî 
==
îî 
null
îî 
)
îî  
{
ïï 
throw
ññ 
new
ññ "
KeyNotFoundException
ññ .
(
ññ. /
$str
óó (
)
óó( )
;
óó) *
}
òò 
if
öö 
(
öö 
!
öö 
patient
öö 
.
öö 
IsActive
öö !
)
öö! "
{
õõ 
throw
úú 
new
úú '
InvalidOperationException
úú 3
(
úú3 4
$str
ùù A
)
ùùA B
;
ùùB C
}
ûû 
var
†† 
doctor
†† 
=
†† 
await
°° 
_doctorRepository
°° '
.
°°' (
GetByIdAsync
°°( 4
(
°°4 5
doctorId
°°5 =
)
°°= >
;
°°> ?
if
££ 
(
££ 
doctor
££ 
==
££ 
null
££ 
)
££ 
{
§§ 
throw
•• 
new
•• "
KeyNotFoundException
•• .
(
••. /
$str
¶¶ '
)
¶¶' (
;
¶¶( )
}
ßß 
if
©© 
(
©© 
!
©© 
doctor
©© 
.
©© 
IsActive
©©  
)
©©  !
{
™™ 
throw
´´ 
new
´´ '
InvalidOperationException
´´ 3
(
´´3 4
$str
¨¨ &
)
¨¨& '
;
¨¨' (
}
≠≠ (
ValidateBookingDateAndSlot
ØØ &
(
ØØ& '
date
∞∞ 
,
∞∞ 
timeSlot
±± 
)
±± 
;
±± 
if
≥≥ 
(
≥≥ 
await
≥≥ $
_appointmentRepository
≥≥ ,
.
≥≥, -6
(ExistsSamePatientSameDoctorSameDateAsync
≥≥- U
(
≥≥U V
	patientId
¥¥ 
,
¥¥ 
doctorId
µµ 
,
µµ 
date
∂∂ 
)
∂∂ 
)
∂∂ 
{
∑∑ 
throw
∏∏ 
new
∏∏ '
InvalidOperationException
∏∏ 3
(
∏∏3 4
$str
ππ _
)
ππ_ `
;
ππ` a
}
∫∫ 
if
ºº 
(
ºº 
await
ºº $
_appointmentRepository
ºº ,
.
ºº, -4
&ExistsSamePatientSameSlotSameDateAsync
ºº- S
(
ººS T
	patientId
ΩΩ 
,
ΩΩ 
date
ææ 
,
ææ 
timeSlot
øø 
)
øø 
)
øø 
{
¿¿ 
throw
¡¡ 
new
¡¡ '
InvalidOperationException
¡¡ 3
(
¡¡3 4
$str
¬¬ P
)
¬¬P Q
;
¬¬Q R
}
√√ 
if
≈≈ 
(
≈≈ 
await
≈≈ $
_appointmentRepository
≈≈ ,
.
≈≈, -3
%ExistsSameDoctorSameSlotSameDateAsync
≈≈- R
(
≈≈R S
doctorId
∆∆ 
,
∆∆ 
date
«« 
,
«« 
timeSlot
»» 
)
»» 
)
»» 
{
…… 
throw
   
new
   '
InvalidOperationException
   3
(
  3 4
$str
ÀÀ B
)
ÀÀB C
;
ÀÀC D
}
ÃÃ 
}
ÕÕ 	
private
œœ 
async
œœ 
Task
œœ (
ValidateUpdateBookingAsync
œœ 5
(
œœ5 6
int
–– 
appointmentId
–– 
,
–– 
int
—— 
	patientId
—— 
,
—— 
int
““ 
doctorId
““ 
,
““ 
DateOnly
”” 
date
”” 
,
”” 
int
‘‘ 
timeSlot
‘‘ 
)
‘‘ 
{
’’ 	
var
÷÷ 
patient
÷÷ 
=
÷÷ 
await
◊◊  
_patientRepository
◊◊ (
.
◊◊( )
GetByIdAsync
◊◊) 5
(
◊◊5 6
	patientId
◊◊6 ?
)
◊◊? @
;
◊◊@ A
if
ŸŸ 
(
ŸŸ 
patient
ŸŸ 
==
ŸŸ 
null
ŸŸ 
)
ŸŸ  
{
⁄⁄ 
throw
€€ 
new
€€ "
KeyNotFoundException
€€ .
(
€€. /
$str
‹‹ (
)
‹‹( )
;
‹‹) *
}
›› 
if
ﬂﬂ 
(
ﬂﬂ 
!
ﬂﬂ 
patient
ﬂﬂ 
.
ﬂﬂ 
IsActive
ﬂﬂ !
)
ﬂﬂ! "
{
‡‡ 
throw
·· 
new
·· '
InvalidOperationException
·· 3
(
··3 4
$str
‚‚ A
)
‚‚A B
;
‚‚B C
}
„„ 
var
ÂÂ 
doctor
ÂÂ 
=
ÂÂ 
await
ÊÊ 
_doctorRepository
ÊÊ '
.
ÊÊ' (
GetByIdAsync
ÊÊ( 4
(
ÊÊ4 5
doctorId
ÊÊ5 =
)
ÊÊ= >
;
ÊÊ> ?
if
ËË 
(
ËË 
doctor
ËË 
==
ËË 
null
ËË 
)
ËË 
{
ÈÈ 
throw
ÍÍ 
new
ÍÍ "
KeyNotFoundException
ÍÍ .
(
ÍÍ. /
$str
ÎÎ '
)
ÎÎ' (
;
ÎÎ( )
}
ÏÏ 
if
ÓÓ 
(
ÓÓ 
!
ÓÓ 
doctor
ÓÓ 
.
ÓÓ 
IsActive
ÓÓ  
)
ÓÓ  !
{
ÔÔ 
throw
 
new
 '
InvalidOperationException
 3
(
3 4
$str
ÒÒ &
)
ÒÒ& '
;
ÒÒ' (
}
ÚÚ (
ValidateBookingDateAndSlot
ÙÙ &
(
ÙÙ& '
date
ıı 
,
ıı 
timeSlot
ˆˆ 
)
ˆˆ 
;
ˆˆ 
if
¯¯ 
(
¯¯ 
await
¯¯ $
_appointmentRepository
¯¯ ,
.
¯¯, -6
(ExistsSamePatientSameDoctorSameDateAsync
¯¯- U
(
¯¯U V
	patientId
˘˘ 
,
˘˘ 
doctorId
˙˙ 
,
˙˙ 
date
˚˚ 
,
˚˚ 
appointmentId
¸¸ !
)
¸¸! "
)
¸¸" #
{
˝˝ 
throw
˛˛ 
new
˛˛ '
InvalidOperationException
˛˛ 3
(
˛˛3 4
$str
ˇˇ _
)
ˇˇ_ `
;
ˇˇ` a
}
ÄÄ 
if
ÇÇ 
(
ÇÇ 
await
ÇÇ $
_appointmentRepository
ÇÇ ,
.
ÇÇ, -4
&ExistsSamePatientSameSlotSameDateAsync
ÇÇ- S
(
ÇÇS T
	patientId
ÉÉ 
,
ÉÉ 
date
ÑÑ 
,
ÑÑ 
timeSlot
ÖÖ 
,
ÖÖ 
appointmentId
ÜÜ !
)
ÜÜ! "
)
ÜÜ" #
{
áá 
throw
àà 
new
àà '
InvalidOperationException
àà 3
(
àà3 4
$str
ââ P
)
ââP Q
;
ââQ R
}
ää 
if
åå 
(
åå 
await
åå $
_appointmentRepository
åå ,
.
åå, -3
%ExistsSameDoctorSameSlotSameDateAsync
åå- R
(
ååR S
doctorId
çç 
,
çç 
date
éé 
,
éé 
timeSlot
èè 
,
èè 
appointmentId
êê !
)
êê! "
)
êê" #
{
ëë 
throw
íí 
new
íí '
InvalidOperationException
íí 3
(
íí3 4
$str
ìì B
)
ììB C
;
ììC D
}
îî 
}
ïï 	
private
óó 
async
óó 
Task
óó 4
&InvalidateDoctorAvailabilityCacheAsync
óó A
(
óóA B
int
òò 
doctorId
òò 
,
òò 
DateOnly
ôô 
date
ôô 
,
ôô 
int
öö 
?
öö 
appointmentId
öö 
=
öö  
null
öö! %
)
öö% &
{
õõ 	
var
úú 
cacheKey
úú 
=
úú '
BuildAvailabilityCacheKey
ùù )
(
ùù) *
doctorId
ûû 
,
ûû 
date
üü 
)
üü 
;
üü 
await
°° 
_cache
°° 
.
°° 
RemoveAsync
°° $
(
°°$ %
cacheKey
°°% -
)
°°- .
;
°°. /
_logger
££ 
.
££ 
LogInformation
££ "
(
££" #
$str
§Ø 
,
ØØ 
doctorId
∞∞ 
,
∞∞ 
appointmentId
±± 
?
±± 
.
±± 
ToString
±± '
(
±±' (
)
±±( )
??
±±* ,
$str
±±- 2
,
±±2 3
date
≤≤ 
,
≤≤ 
cacheKey
≥≥ 
)
≥≥ 
;
≥≥ 
}
¥¥ 	
private
∂∂ 
static
∂∂ 
string
∂∂ '
BuildAvailabilityCacheKey
∂∂ 7
(
∂∂7 8
int
∑∑ 
doctorId
∑∑ 
,
∑∑ 
DateOnly
∏∏ 
date
∏∏ 
)
∏∏ 
{
ππ 	
return
∫∫ 
$"
∫∫ 
$str
∫∫ 
{
∫∫ 
doctorId
∫∫ &
}
∫∫& '
$str
∫∫' 5
{
∫∫5 6
date
∫∫6 :
:
∫∫: ;
$str
∫∫; E
}
∫∫E F
"
∫∫F G
;
∫∫G H
}
ªª 	
private
ΩΩ 
static
ΩΩ 
void
ΩΩ (
ValidateBookingDateAndSlot
ΩΩ 6
(
ΩΩ6 7
DateOnly
ææ 
date
ææ 
,
ææ 
int
øø 
timeSlot
øø 
)
øø 
{
¿¿ 	
var
¡¡ 
today
¡¡ 
=
¡¡ 
DateOnly
¬¬ 
.
¬¬ 
FromDateTime
¬¬ %
(
¬¬% &
DateTime
¬¬& .
.
¬¬. /
Today
¬¬/ 4
)
¬¬4 5
;
¬¬5 6
var
ƒƒ 
maxBookingDate
ƒƒ 
=
ƒƒ  
today
≈≈ 
.
≈≈ 
AddDays
≈≈ 
(
≈≈ 
$num
≈≈  
)
≈≈  !
;
≈≈! "
if
«« 
(
«« 
date
«« 
<
«« 
today
«« 
)
«« 
{
»» 
throw
…… 
new
…… 
ArgumentException
…… +
(
……+ ,
$str
   =
)
  = >
;
  > ?
}
ÀÀ 
if
ÕÕ 
(
ÕÕ 
date
ÕÕ 
>
ÕÕ 
maxBookingDate
ÕÕ %
)
ÕÕ% &
{
ŒŒ 
throw
œœ 
new
œœ 
ArgumentException
œœ +
(
œœ+ ,
$str
–– K
)
––K L
;
––L M
}
—— 
if
”” 
(
”” 
!
”” 
Enum
”” 
.
”” 
	IsDefined
”” 
(
””  
typeof
””  &
(
””& '!
AppointmentTimeSlot
””' :
)
””: ;
,
””; <
timeSlot
””= E
)
””E F
)
””F G
{
‘‘ 
throw
’’ 
new
’’ 
ArgumentException
’’ +
(
’’+ ,
$str
÷÷ /
)
÷÷/ 0
;
÷÷0 1
}
◊◊ 
var
ŸŸ 
slotEnum
ŸŸ 
=
ŸŸ 
(
⁄⁄ !
AppointmentTimeSlot
⁄⁄ $
)
⁄⁄$ %
timeSlot
⁄⁄% -
;
⁄⁄- .
if
‹‹ 
(
‹‹ 
date
‹‹ 
==
‹‹ 
today
‹‹ 
)
‹‹ 
{
›› 
var
ﬁﬁ 
now
ﬁﬁ 
=
ﬁﬁ 
TimeOnly
ﬂﬂ 
.
ﬂﬂ 
FromDateTime
ﬂﬂ )
(
ﬂﬂ) *
DateTime
ﬂﬂ* 2
.
ﬂﬂ2 3
Now
ﬂﬂ3 6
)
ﬂﬂ6 7
;
ﬂﬂ7 8
var
·· 
slotStartTime
·· !
=
··" #
GetSlotStartTime
‚‚ $
(
‚‚$ %
slotEnum
‚‚% -
)
‚‚- .
;
‚‚. /
if
‰‰ 
(
‰‰ 
slotStartTime
‰‰ !
<
‰‰" #
now
‰‰$ '
)
‰‰' (
{
ÂÂ 
throw
ÊÊ 
new
ÊÊ '
InvalidOperationException
ÊÊ 7
(
ÊÊ7 8
$str
ÁÁ @
)
ÁÁ@ A
;
ÁÁA B
}
ËË 
}
ÈÈ 
}
ÍÍ 	
private
ÏÏ 
static
ÏÏ 
TimeOnly
ÏÏ 
GetSlotStartTime
ÏÏ  0
(
ÏÏ0 1!
AppointmentTimeSlot
ÌÌ 
slot
ÌÌ  $
)
ÌÌ$ %
{
ÓÓ 	
return
ÔÔ 
slot
ÔÔ 
switch
ÔÔ 
{
 !
AppointmentTimeSlot
ÒÒ #
.
ÒÒ# $
TenAM
ÒÒ$ )
=>
ÒÒ* ,
new
ÒÒ- 0
TimeOnly
ÒÒ1 9
(
ÒÒ9 :
$num
ÒÒ: <
,
ÒÒ< =
$num
ÒÒ> ?
)
ÒÒ? @
,
ÒÒ@ A!
AppointmentTimeSlot
ÚÚ #
.
ÚÚ# $
TenThirtyAM
ÚÚ$ /
=>
ÚÚ0 2
new
ÚÚ3 6
TimeOnly
ÚÚ7 ?
(
ÚÚ? @
$num
ÚÚ@ B
,
ÚÚB C
$num
ÚÚD F
)
ÚÚF G
,
ÚÚG H!
AppointmentTimeSlot
ÛÛ #
.
ÛÛ# $
ElevenAM
ÛÛ$ ,
=>
ÛÛ- /
new
ÛÛ0 3
TimeOnly
ÛÛ4 <
(
ÛÛ< =
$num
ÛÛ= ?
,
ÛÛ? @
$num
ÛÛA B
)
ÛÛB C
,
ÛÛC D!
AppointmentTimeSlot
ÙÙ #
.
ÙÙ# $
ElevenThirtyAM
ÙÙ$ 2
=>
ÙÙ3 5
new
ÙÙ6 9
TimeOnly
ÙÙ: B
(
ÙÙB C
$num
ÙÙC E
,
ÙÙE F
$num
ÙÙG I
)
ÙÙI J
,
ÙÙJ K!
AppointmentTimeSlot
ıı #
.
ıı# $
TwelvePM
ıı$ ,
=>
ıı- /
new
ıı0 3
TimeOnly
ıı4 <
(
ıı< =
$num
ıı= ?
,
ıı? @
$num
ııA B
)
ııB C
,
ııC D!
AppointmentTimeSlot
ˆˆ #
.
ˆˆ# $
TwelveThirtyPM
ˆˆ$ 2
=>
ˆˆ3 5
new
ˆˆ6 9
TimeOnly
ˆˆ: B
(
ˆˆB C
$num
ˆˆC E
,
ˆˆE F
$num
ˆˆG I
)
ˆˆI J
,
ˆˆJ K!
AppointmentTimeSlot
˜˜ #
.
˜˜# $
OnePM
˜˜$ )
=>
˜˜* ,
new
˜˜- 0
TimeOnly
˜˜1 9
(
˜˜9 :
$num
˜˜: <
,
˜˜< =
$num
˜˜> ?
)
˜˜? @
,
˜˜@ A!
AppointmentTimeSlot
¯¯ #
.
¯¯# $
OneThirtyPM
¯¯$ /
=>
¯¯0 2
new
¯¯3 6
TimeOnly
¯¯7 ?
(
¯¯? @
$num
¯¯@ B
,
¯¯B C
$num
¯¯D F
)
¯¯F G
,
¯¯G H!
AppointmentTimeSlot
˘˘ #
.
˘˘# $
TwoPM
˘˘$ )
=>
˘˘* ,
new
˘˘- 0
TimeOnly
˘˘1 9
(
˘˘9 :
$num
˘˘: <
,
˘˘< =
$num
˘˘> ?
)
˘˘? @
,
˘˘@ A!
AppointmentTimeSlot
˙˙ #
.
˙˙# $
TwoThirtyPM
˙˙$ /
=>
˙˙0 2
new
˙˙3 6
TimeOnly
˙˙7 ?
(
˙˙? @
$num
˙˙@ B
,
˙˙B C
$num
˙˙D F
)
˙˙F G
,
˙˙G H!
AppointmentTimeSlot
˚˚ #
.
˚˚# $
ThreePM
˚˚$ +
=>
˚˚, .
new
˚˚/ 2
TimeOnly
˚˚3 ;
(
˚˚; <
$num
˚˚< >
,
˚˚> ?
$num
˚˚@ A
)
˚˚A B
,
˚˚B C!
AppointmentTimeSlot
¸¸ #
.
¸¸# $
ThreeThirtyPM
¸¸$ 1
=>
¸¸2 4
new
¸¸5 8
TimeOnly
¸¸9 A
(
¸¸A B
$num
¸¸B D
,
¸¸D E
$num
¸¸F H
)
¸¸H I
,
¸¸I J
_
˝˝ 
=>
˝˝ 
TimeOnly
˝˝ 
.
˝˝ 
MinValue
˝˝ &
}
˛˛ 
;
˛˛ 
}
ˇˇ 	
private
ÅÅ 
static
ÅÅ 
AppointmentDto
ÅÅ %!
MapToAppointmentDto
ÅÅ& 9
(
ÅÅ9 :
Appointment
ÇÇ 
appointment
ÇÇ #
)
ÇÇ# $
{
ÉÉ 	
return
ÑÑ 
new
ÑÑ 
AppointmentDto
ÑÑ %
{
ÖÖ 
AppointmentId
ÜÜ 
=
ÜÜ 
appointment
ÜÜ  +
.
ÜÜ+ ,
AppointmentId
ÜÜ, 9
,
ÜÜ9 :
	PatientId
áá 
=
áá 
appointment
áá '
.
áá' (
	PatientId
áá( 1
,
áá1 2
DoctorId
àà 
=
àà 
appointment
àà &
.
àà& '
DoctorId
àà' /
,
àà/ 0
ScheduledDate
ââ 
=
ââ 
appointment
ââ  +
.
ââ+ ,
ScheduledDate
ââ, 9
,
ââ9 :
TimeSlot
ää 
=
ää 
(
ää 
int
ää 
)
ää  
appointment
ää  +
.
ää+ ,
TimeSlot
ää, 4
,
ää4 5
Status
ãã 
=
ãã 
(
ãã 
int
ãã 
)
ãã 
appointment
ãã )
.
ãã) *
Status
ãã* 0
,
ãã0 1 
CancellationReason
åå "
=
åå# $
appointment
åå% 0
.
åå0 1 
CancellationReason
åå1 C
}
çç 
;
çç 
}
éé 	
private
êê 
static
êê #
AppointmentDetailsDto
êê ,(
MapToAppointmentDetailsDto
êê- G
(
êêG H
Appointment
ëë 
appointment
ëë #
)
ëë# $
{
íí 	
return
ìì 
new
ìì #
AppointmentDetailsDto
ìì ,
{
îî 
AppointmentId
ïï 
=
ïï 
appointment
ïï  +
.
ïï+ ,
AppointmentId
ïï, 9
,
ïï9 :
	PatientId
ññ 
=
ññ 
appointment
ññ '
.
ññ' (
	PatientId
ññ( 1
,
ññ1 2
PatientName
óó 
=
óó 
appointment
óó )
.
óó) *
Patient
óó* 1
?
óó1 2
.
óó2 3
FullName
óó3 ;
??
óó< >
string
óó? E
.
óóE F
Empty
óóF K
,
óóK L
DoctorId
òò 
=
òò 
appointment
òò &
.
òò& '
DoctorId
òò' /
,
òò/ 0

DoctorName
ôô 
=
ôô 
appointment
ôô (
.
ôô( )
Doctor
ôô) /
?
ôô/ 0
.
ôô0 1
FullName
ôô1 9
??
ôô: <
string
ôô= C
.
ôôC D
Empty
ôôD I
,
ôôI J
ScheduledDate
öö 
=
öö 
appointment
öö  +
.
öö+ ,
ScheduledDate
öö, 9
,
öö9 :
TimeSlot
õõ 
=
õõ 
(
õõ 
int
õõ 
)
õõ  
appointment
õõ  +
.
õõ+ ,
TimeSlot
õõ, 4
,
õõ4 5
Status
úú 
=
úú 
(
úú 
int
úú 
)
úú 
appointment
úú )
.
úú) *
Status
úú* 0
,
úú0 1 
CancellationReason
ùù "
=
ùù# $
appointment
ùù% 0
.
ùù0 1 
CancellationReason
ùù1 C
}
ûû 
;
ûû 
}
üü 	
private
°° 
static
°° #
DoctorScheduleItemDto
°° ,#
MapDoctorScheduleItem
°°- B
(
°°B C
Appointment
¢¢ 
appointment
¢¢ #
)
¢¢# $
{
££ 	
return
§§ 
new
§§ #
DoctorScheduleItemDto
§§ ,
{
•• 
AppointmentId
¶¶ 
=
¶¶ 
appointment
¶¶  +
.
¶¶+ ,
AppointmentId
¶¶, 9
,
¶¶9 :
ScheduledDate
ßß 
=
ßß 
appointment
ßß  +
.
ßß+ ,
ScheduledDate
ßß, 9
,
ßß9 :
TimeSlot
®® 
=
®® 
(
®® 
int
®® 
)
®®  
appointment
®®  +
.
®®+ ,
TimeSlot
®®, 4
,
®®4 5
	PatientId
©© 
=
©© 
appointment
©© '
.
©©' (
	PatientId
©©( 1
,
©©1 2
PatientName
™™ 
=
™™ 
appointment
™™ )
.
™™) *
Patient
™™* 1
.
™™1 2
FullName
™™2 :
,
™™: ;
Status
´´ 
=
´´ 
(
´´ 
int
´´ 
)
´´ 
appointment
´´ )
.
´´) *
Status
´´* 0
,
´´0 1 
CancellationReason
¨¨ "
=
¨¨# $
appointment
¨¨% 0
.
¨¨0 1 
CancellationReason
¨¨1 C
,
¨¨C D
HasHealthRecord
≠≠ 
=
≠≠  !
appointment
≠≠" -
.
≠≠- .
HealthRecord
≠≠. :
!=
≠≠; =
null
≠≠> B
}
ÆÆ 
;
ÆÆ 
}
ØØ 	
}
∞∞ 
}±± ê3
fC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Services\Implementation\AdminService.cs
	namespace 	
S4_HealthAxisApi
 
. 
Services #
.# $
Implementation$ 2
{ 
public 

class 
AdminService 
: 
IAdminService  -
{ 
private		 
readonly		 
IAdminRepository		 )
_repository		* 5
;		5 6
public 
AdminService 
( 
IAdminRepository ,

repository- 7
)7 8
{ 	
_repository 
= 

repository $
;$ %
} 	
public 
async 
Task 
< 
AdminDashboardDto +
>+ ,
GetDashboardAsync- >
(> ?
)? @
{ 	
return 
new 
AdminDashboardDto (
{ 
TotalPatients 
= 
await  %
_repository& 1
.1 2
CountPatientsAsync2 D
(D E
)E F
,F G
ActivePatients 
=  
await! &
_repository' 2
.2 3$
CountActivePatientsAsync3 K
(K L
)L M
,M N
TotalDoctors 
= 
await $
_repository% 0
.0 1
CountDoctorsAsync1 B
(B C
)C D
,D E
ActiveDoctors 
= 
await  %
_repository& 1
.1 2#
CountActiveDoctorsAsync2 I
(I J
)J K
,K L
TodayAppointments !
=" #
await$ )
_repository* 5
.5 6'
CountTodayAppointmentsAsync6 Q
(Q R
)R S
,S T
PendingAppointments #
=$ %
await& +
_repository, 7
.7 8)
CountPendingAppointmentsAsync8 U
(U V
)V W
,W X!
CompletedAppointments %
=& '
await( -
_repository. 9
.9 :+
CountCompletedAppointmentsAsync: Y
(Y Z
)Z [
} 
; 
} 	
public 
async 
Task 
< 
AdminStatisticsDto ,
>, -
GetStatisticsAsync. @
(@ A
)A B
{ 	
return   
new   
AdminStatisticsDto   )
{!! 
Patients"" 
="" 
await""  
_repository""! ,
."", -
CountPatientsAsync""- ?
(""? @
)""@ A
,""A B
Doctors## 
=## 
await## 
_repository##  +
.##+ ,
CountDoctorsAsync##, =
(##= >
)##> ?
,##? @
Appointments$$ 
=$$ 
await$$ $
_repository$$% 0
.$$0 1'
CountTodayAppointmentsAsync$$1 L
($$L M
)$$M N
,$$N O
HealthRecords%% 
=%% 
await%%  %
_repository%%& 1
.%%1 2#
CountHealthRecordsAsync%%2 I
(%%I J
)%%J K
}&& 
;&& 
}'' 	
public)) 
async)) 
Task)) 
<)) 
IEnumerable)) %
<))% &
UserManagementDto))& 7
>))7 8
>))8 9
GetUsersAsync)): G
())G H
)))H I
{** 	
var++ 
users++ 
=++ 
await++ 
_repository++ )
.++) *
GetUsersAsync++* 7
(++7 8
)++8 9
;++9 :
var-- 
result-- 
=-- 
new-- 
List-- !
<--! "
UserManagementDto--" 3
>--3 4
(--4 5
)--5 6
;--6 7
foreach// 
(// 
var// 
u// 
in// 
users// #
)//# $
{00 
var11 
roleText11 
=11 
u11  
.11  !
Role11! %
.11% &
ToString11& .
(11. /
)11/ 0
;110 1
result33 
.33 
Add33 
(33 
new33 
UserManagementDto33 0
{44 
UserId55 
=55 
u55 
.55 
UserId55 %
,55% &
Email66 
=66 
u66 
.66 
Email66 #
,66# $
Role77 
=77 
roleText77 #
,77# $
IsActive88 
=88 
await88 $
_repository88% 0
.880 1(
ResolveUserActiveStatusAsync881 M
(88M N
u88N O
.88O P
Email88P U
,88U V
roleText88W _
)88_ `
}99 
)99 
;99 
}:: 
return<< 
result<< 
;<< 
}== 	
public?? 
async?? 
Task?? 
<?? 
UserManagementDto?? +
???+ ,
>??, -
GetUserByIdAsync??. >
(??> ?
int??? B
id??C E
)??E F
{@@ 	
varAA 
userAA 
=AA 
awaitAA 
_repositoryAA (
.AA( )
GetUserByIdAsyncAA) 9
(AA9 :
idAA: <
)AA< =
;AA= >
ifCC 
(CC 
userCC 
==CC 
nullCC 
)CC 
returnDD 
nullDD 
;DD 
varFF 
roleTextFF 
=FF 
userFF 
.FF  
RoleFF  $
.FF$ %
ToStringFF% -
(FF- .
)FF. /
;FF/ 0
returnHH 
newHH 
UserManagementDtoHH (
{II 
UserIdJJ 
=JJ 
userJJ 
.JJ 
UserIdJJ $
,JJ$ %
EmailKK 
=KK 
userKK 
.KK 
EmailKK "
,KK" #
RoleLL 
=LL 
roleTextLL 
,LL  
IsActiveMM 
=MM 
awaitMM  
_repositoryMM! ,
.MM, -(
ResolveUserActiveStatusAsyncMM- I
(MMI J
userMMJ N
.MMN O
EmailMMO T
,MMT U
roleTextMMV ^
)MM^ _
}NN 
;NN 
}OO 	
}PP 
}QQ •
hC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Repositories\Interface\IUserRepository.cs
	namespace 	
S4_HealthAxisApi
 
. 

Repository %
.% &
	Interface& /
{ 
public 

	interface 
IUserRepository $
{ 
Task 
< 
User 
? 
> 
GetByIdAsync  
(  !
int! $
id% '
)' (
;( )
Task		 
<		 
User		 
?		 
>		 
GetByEmailAsync		 #
(		# $
string		$ *
email		+ 0
)		0 1
;		1 2
Task

 
<

 
IEnumerable

 
<

 
User

 
>

 
>

 
GetByRoleAsync

  .
(

. /
UserRole

/ 7
role

8 <
)

< =
;

= >
Task 
AddAsync 
( 
User 
user 
)  
;  !
Task 
UpdateAsync 
( 
User 
user "
)" #
;# $
Task 
< 
bool 
> 
EmailExistsAsync #
(# $
string$ *
email+ 0
)0 1
;1 2
Task 
SaveChangesAsync 
( 
) 
;  
Task 
< 
User 
? 
> "
GetByRefreshTokenAsync *
(* +
string+ 1
refreshToken2 >
)> ?
;? @
} 
} „
kC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Repositories\Interface\IPatientRepository.cs
	namespace 	
S4_HealthAxisApi
 
. 

Repository %
.% &
	Interface& /
{ 
public 

	interface 
IPatientRepository '
{ 
Task 
< 
IEnumerable 
< 
Patient  
>  !
>! "
GetAllAsync# .
(. /
)/ 0
;0 1
Task 
< 
Patient 
? 
> 
GetByIdAsync #
(# $
int$ '
id( *
)* +
;+ ,
Task		 
<		 
IEnumerable		 
<		 
Patient		  
>		  !
>		! "
SearchByNameAsync		# 4
(		4 5
string		5 ;
name		< @
)		@ A
;		A B
Task

 
AddAsync

 
(

 
Patient

 
patient

 %
)

% &
;

& '
Task 
UpdateAsync 
( 
Patient  
patient! (
)( )
;) *
Task 
< 
bool 
> 
ExistsAsync 
( 
int "
id# %
)% &
;& '
Task 
SaveChangesAsync 
( 
) 
;  
} 
} Ô

pC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Repositories\Interface\IHealthRecordRepository.cs
	namespace 	
S4_HealthAxisApi
 
. 

Repository %
.% &
	Interface& /
{ 
public 

	interface #
IHealthRecordRepository ,
{ 
Task 
< 
HealthRecord 
? 
> 
GetByIdAsync (
(( )
int) ,
id- /
)/ 0
;0 1
Task		 
<		 
HealthRecord		 
?		 
>		 #
GetByAppointmentIdAsync		 3
(		3 4
int		4 7
appointmentId		8 E
)		E F
;		F G
Task 
< 
IEnumerable 
< 
HealthRecord %
>% &
>& '
GetByPatientIdAsync( ;
(; <
int< ?
	patientId@ I
)I J
;J K
Task 
AddAsync 
( 
HealthRecord "
record# )
)) *
;* +
Task 
UpdateAsync 
( 
HealthRecord %
record& ,
), -
;- .
Task 
SaveChangesAsync 
( 
) 
;  
} 
} Ë

kC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Repositories\Interface\IGenericRepository.cs
	namespace 	
S4_HealthAxisApi
 
. 

Repository %
.% &
	Interface& /
{ 
public 

	interface 
IGenericRepository '
<' (
T( )
>) *
where+ 0
T1 2
:3 4
class5 :
{ 
Task 
< 
IEnumerable 
< 
T 
> 
> 
GetAllAsync (
(( )
)) *
;* +
Task 
< 
T 
? 
> 
GetByIdAsync 
( 
int !
id" $
)$ %
;% &
Task		 
AddAsync		 
(		 
T		 
entity		 
)		 
;		  
Task 
UpdateAsync 
( 
T 
entity !
)! "
;" #
Task 
DeleteAsync 
( 
int 
id 
)  
;  !
Task 
< 
bool 
> 
ExistsAsync 
( 
int "
id# %
)% &
;& '
} 
} î
jC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Repositories\Interface\IDoctorRepository.cs
	namespace 	
S4_HealthAxisApi
 
. 

Repository %
.% &
	Interface& /
{ 
public 

	interface 
IDoctorRepository &
{ 
Task 
< 
IEnumerable 
< 
Doctor 
>  
>  !
GetAllAsync" -
(- .
string. 4
?4 5
sortBy6 <
,< =
int> A
?A B
specialisationC Q
)Q R
;R S
Task 
< 
IEnumerable 
< 
Doctor 
>  
>  !*
GetActiveBySpecialisationAsync" @
(@ A
intA D
specialisationE S
)S T
;T U
Task		 
<		 
Doctor		 
?		 
>		 
GetByIdAsync		 "
(		" #
int		# &
id		' )
)		) *
;		* +
Task

 
AddAsync

 
(

 
Doctor

 
doctor

 #
)

# $
;

$ %
Task 
UpdateAsync 
( 
Doctor 
doctor  &
)& '
;' (
Task 
< 
bool 
> 
ExistsAsync 
( 
int "
id# %
)% &
;& '
Task 
< 
IEnumerable 
< 
int 
> 
> 
GetBookedSlotsAsync 2
(2 3
int3 6
doctorId7 ?
,? @
DateOnly@ H
dateI M
)M N
;N O
Task 
SaveChangesAsync 
( 
) 
;  
} 
} ∂#
oC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Repositories\Interface\IAppointmentRepository.cs
	namespace 	
S4_HealthAxisApi
 
. 

Repository %
.% &
	Interface& /
{ 
public 

	interface "
IAppointmentRepository +
{ 
Task 
< 
IEnumerable 
< 
Appointment $
>$ %
>% &
GetAllAsync' 2
(2 3
)3 4
;4 5
Task 
< 
Appointment 
? 
> 
GetByIdAsync '
(' (
int( +
id, .
). /
;/ 0
Task		 
<		 
IEnumerable		 
<		 
Appointment		 $
>		$ %
>		% &
GetByPatientIdAsync		' :
(		: ;
int		; >
	patientId		? H
)		H I
;		I J
Task 
< 
IEnumerable 
< 
Appointment $
>$ %
>% &'
GetDoctorTodayScheduleAsync' B
(B C
intC F
doctorIdG O
,O P
DateOnlyQ Y
todayZ _
)_ `
;` a
Task 
< 
IEnumerable 
< 
Appointment $
>$ %
>% &&
GetDoctorWeekScheduleAsync' A
(A B
intB E
doctorIdF N
,N O
DateOnlyP X
	startDateY b
,b c
DateOnlyd l
endDatem t
)t u
;u v
Task 
< 
bool 
> 4
(ExistsSamePatientSameDoctorSameDateAsync ;
(; <
int< ?
	patientId@ I
,I J
intK N
doctorIdO W
,W X
DateOnlyY a
dateb f
)f g
;g h
Task 
< 
bool 
> 2
&ExistsSamePatientSameSlotSameDateAsync 9
(9 :
int: =
	patientId> G
,G H
DateOnlyI Q
dateR V
,V W
intX [
timeSlot\ d
)d e
;e f
Task 
< 
bool 
> 1
%ExistsSameDoctorSameSlotSameDateAsync 8
(8 9
int9 <
doctorId= E
,E F
DateOnlyG O
dateP T
,T U
intV Y
timeSlotZ b
)b c
;c d
Task 
< 
bool 
> 4
(ExistsSamePatientSameDoctorSameDateAsync ;
(; <
int< ?
	patientId@ I
,I J
intK N
doctorIdO W
,W X
DateOnlyY a
dateb f
,f g
inth k
appointmentIdl y
)y z
;z {
Task 
< 
bool 
> 2
&ExistsSamePatientSameSlotSameDateAsync 9
(9 :
int: =
	patientId> G
,G H
DateOnlyI Q
dateR V
,V W
intX [
timeSlot\ d
,d e
intf i
appointmentIdj w
)w x
;x y
Task 
< 
bool 
> 1
%ExistsSameDoctorSameSlotSameDateAsync 8
(8 9
int9 <
doctorId= E
,E F
DateOnlyG O
dateP T
,T U
intV Y
timeSlotZ b
,b c
intd g
appointmentIdh u
)u v
;v w
Task 
< 
IEnumerable 
< 
Appointment $
>$ %
>% &-
!GetDoctorPatientAppointmentsAsync' H
(H I
intI L
doctorIdM U
)U V
;V W
Task 
AddAsync 
( 
Appointment !
appointment" -
)- .
;. /
Task 
UpdateAsync 
( 
Appointment $
appointment% 0
)0 1
;1 2
Task 
< 
bool 
> 
ExistsAsync 
( 
int "
id# %
)% &
;& '
Task 
SaveChangesAsync 
( 
) 
;  
} 
} ˇ
iC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Repositories\Interface\IAdminRepository.cs
	namespace 	
S4_HealthAxisApi
 
. 

Repository %
.% &
	Interface& /
{ 
public 

	interface 
IAdminRepository %
{ 
Task 
< 
int 
> 
CountPatientsAsync $
($ %
)% &
;& '
Task		 
<		 
int		 
>		 $
CountActivePatientsAsync		 *
(		* +
)		+ ,
;		, -
Task 
< 
int 
> 
CountDoctorsAsync #
(# $
)$ %
;% &
Task 
< 
int 
> #
CountActiveDoctorsAsync )
() *
)* +
;+ ,
Task 
< 
int 
> '
CountTodayAppointmentsAsync -
(- .
). /
;/ 0
Task 
< 
int 
> )
CountPendingAppointmentsAsync /
(/ 0
)0 1
;1 2
Task 
< 
int 
> +
CountCompletedAppointmentsAsync 1
(1 2
)2 3
;3 4
Task 
< 
int 
> #
CountHealthRecordsAsync )
() *
)* +
;+ ,
Task 
< 
IEnumerable 
< 
User 
> 
> 
GetUsersAsync  -
(- .
). /
;/ 0
Task 
< 
bool 
> (
ResolveUserActiveStatusAsync /
(/ 0
string0 6
email7 <
,< =
string> D
roleE I
)I J
;J K
Task 
< 
User 
? 
> 
GetUserByIdAsync $
($ %
int% (
id) +
)+ ,
;, -
} 
} Û$
lC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Repositories\Implementation\UserRepository.cs
	namespace 	
S4_HealthAxisApi
 
. 

Repository %
.% &
Implementation& 4
{		 
[

 #
ExcludeFromCodeCoverage

 
]

 
public 

class 
UserRepository 
:  !
IUserRepository" 1
{ 
private 
readonly 
HealthAxisDbContext ,
_context- 5
;5 6
public 
UserRepository 
( 
HealthAxisDbContext 1
context2 9
)9 :
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
User 
? 
>  
GetByIdAsync! -
(- .
int. 1
id2 4
)4 5
{ 	
return 
await 
_context !
.! "
AppUsers" *
. 
FirstOrDefaultAsync $
($ %
u% &
=>' )
u* +
.+ ,
UserId, 2
==3 5
id6 8
)8 9
;9 :
} 	
public 
async 
Task 
< 
User 
? 
>  
GetByEmailAsync! 0
(0 1
string1 7
email8 =
)= >
{ 	
return 
await 
_context !
.! "
AppUsers" *
. 
FirstOrDefaultAsync $
($ %
u% &
=>' )
u* +
.+ ,
Email, 1
==2 4
email5 :
): ;
;; <
} 	
public   
async   
Task   
<   
IEnumerable   %
<  % &
User  & *
>  * +
>  + ,
GetByRoleAsync  - ;
(  ; <
UserRole  < D
role  E I
)  I J
{!! 	
return"" 
await"" 
_context"" !
.""! "
AppUsers""" *
.## 
Where## 
(## 
u## 
=>## 
u## 
.## 
Role## "
==### %
role##& *
)##* +
.$$ 
ToListAsync$$ 
($$ 
)$$ 
;$$ 
}%% 	
public'' 
async'' 
Task'' 
AddAsync'' "
(''" #
User''# '
user''( ,
)'', -
{(( 	
await)) 
_context)) 
.)) 
AppUsers)) #
.))# $
AddAsync))$ ,
()), -
user))- 1
)))1 2
;))2 3
}** 	
public,, 
Task,, 
UpdateAsync,, 
(,,  
User,,  $
user,,% )
),,) *
{-- 	
_context.. 
... 
AppUsers.. 
... 
Update.. $
(..$ %
user..% )
)..) *
;..* +
return// 
Task// 
.// 
CompletedTask// %
;//% &
}00 	
public22 
async22 
Task22 
<22 
bool22 
>22 
EmailExistsAsync22  0
(220 1
string221 7
email228 =
)22= >
{33 	
return44 
await44 
_context44 !
.44! "
AppUsers44" *
.55 
AnyAsync55 
(55 
u55 
=>55 
u55  
.55  !
Email55! &
==55' )
email55* /
)55/ 0
;550 1
}66 	
public88 
async88 
Task88 
SaveChangesAsync88 *
(88* +
)88+ ,
{99 	
await:: 
_context:: 
.:: 
SaveChangesAsync:: +
(::+ ,
)::, -
;::- .
};; 	
public== 
async== 
Task== 
<== 
User== 
?== 
>==  "
GetByRefreshTokenAsync==! 7
(==7 8
string==8 >
refreshToken==? K
)==K L
{>> 	
return?? 
await?? 
_context?? !
.??! "
AppUsers??" *
.@@ 
FirstOrDefaultAsync@@ $
(@@$ %
u@@% &
=>@@' )
u@@* +
.@@+ ,
RefreshToken@@, 8
==@@9 ;
refreshToken@@< H
)@@H I
;@@I J
}AA 	
}BB 
}CC Ø&
oC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Repositories\Implementation\PatientRepository.cs
	namespace 	
S4_HealthAxisApi
 
. 

Repository %
.% &
Implementation& 4
{ 
[		 #
ExcludeFromCodeCoverage		 
]		 
public

 

class

 
PatientRepository

 "
:

# $
IPatientRepository

% 7
{ 
private 
readonly 
HealthAxisDbContext ,
_context- 5
;5 6
public 
PatientRepository  
(  !
HealthAxisDbContext! 4
context5 <
)< =
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Patient& -
>- .
>. /
GetAllAsync0 ;
(; <
)< =
{ 	
return 
await 
_context !
.! "
Patients" *
. 
OrderBy 
( 
p 
=> 
p 
.  
	PatientId  )
)) *
. 
ToListAsync 
( 
) 
; 
} 	
public 
async 
Task 
< 
Patient !
?! "
>" #
GetByIdAsync$ 0
(0 1
int1 4
id5 7
)7 8
{ 	
return 
await 
_context !
.! "
Patients" *
. 
FirstOrDefaultAsync $
($ %
p% &
=>' )
p* +
.+ ,
	PatientId, 5
==6 8
id9 ;
); <
;< =
} 	
public   
async   
Task   
<   
IEnumerable   %
<  % &
Patient  & -
>  - .
>  . /
SearchByNameAsync  0 A
(  A B
string  B H
name  I M
)  M N
{!! 	
if"" 
("" 
string"" 
."" 
IsNullOrWhiteSpace"" )
("") *
name""* .
)"". /
)""/ 0
return## 
new## 
List## 
<##  
Patient##  '
>##' (
(##( )
)##) *
;##* +
name%% 
=%% 
name%% 
.%% 
Trim%% 
(%% 
)%% 
;%% 
return'' 
await'' 
_context'' !
.''! "
Patients''" *
.(( 
Where(( 
((( 
p(( 
=>(( 
p(( 
.(( 
IsActive(( &
&&((' )
p((* +
.((+ ,
FullName((, 4
.((4 5
Contains((5 =
(((= >
name((> B
)((B C
)((C D
.)) 
OrderBy)) 
()) 
p)) 
=>)) 
p)) 
.))  
FullName))  (
)))( )
.** 
ToListAsync** 
(** 
)** 
;** 
}++ 	
public-- 
async-- 
Task-- 
AddAsync-- "
(--" #
Patient--# *
patient--+ 2
)--2 3
{.. 	
await// 
_context// 
.// 
Patients// #
.//# $
AddAsync//$ ,
(//, -
patient//- 4
)//4 5
;//5 6
}00 	
public22 
Task22 
UpdateAsync22 
(22  
Patient22  '
patient22( /
)22/ 0
{33 	
_context44 
.44 
Patients44 
.44 
Update44 $
(44$ %
patient44% ,
)44, -
;44- .
return55 
Task55 
.55 
CompletedTask55 %
;55% &
}66 	
public88 
async88 
Task88 
<88 
bool88 
>88 
ExistsAsync88  +
(88+ ,
int88, /
id880 2
)882 3
{99 	
return:: 
await:: 
_context:: !
.::! "
Patients::" *
.::* +
AnyAsync::+ 3
(::3 4
p::4 5
=>::6 8
p::9 :
.::: ;
	PatientId::; D
==::E G
id::H J
)::J K
;::K L
};; 	
public== 
async== 
Task== 
SaveChangesAsync== *
(==* +
)==+ ,
{>> 	
await?? 
_context?? 
.?? 
SaveChangesAsync?? +
(??+ ,
)??, -
;??- .
}@@ 	
}AA 
}BB ñ)
tC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Repositories\Implementation\HealthRecordRepository.cs
	namespace 	
S4_HealthAxisApi
 
. 

Repository %
.% &
Implementation& 4
{ 
[		 #
ExcludeFromCodeCoverage		 
]		 
public

 

class

 "
HealthRecordRepository

 '
:

( )#
IHealthRecordRepository

* A
{ 
private 
readonly 
HealthAxisDbContext ,
_context- 5
;5 6
public "
HealthRecordRepository %
(% &
HealthAxisDbContext& 9
context: A
)A B
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
HealthRecord &
?& '
>' (
GetByIdAsync) 5
(5 6
int6 9
id: <
)< =
{ 	
return 
await 
_context !
.! "
HealthRecords" /
. 
Include 
( 
r 
=> 
r 
.  
Doctor  &
)& '
. 
Include 
( 
r 
=> 
r 
.  
Patient  '
)' (
. 
Include 
( 
r 
=> 
r 
.  
Appointment  +
)+ ,
. 
FirstOrDefaultAsync $
($ %
r% &
=>' )
r* +
.+ ,
HealthRecordId, :
==; =
id> @
)@ A
;A B
} 	
public 
async 
Task 
< 
HealthRecord &
?& '
>' (#
GetByAppointmentIdAsync) @
(@ A
intA D
appointmentIdE R
)R S
{ 	
return 
await 
_context !
.! "
HealthRecords" /
. 
Include 
( 
r 
=> 
r 
.  
Doctor  &
)& '
.   
Include   
(   
r   
=>   
r   
.    
Patient    '
)  ' (
.!! 
Include!! 
(!! 
r!! 
=>!! 
r!! 
.!!  
Appointment!!  +
)!!+ ,
."" 
FirstOrDefaultAsync"" $
(""$ %
r""% &
=>""' )
r""* +
.""+ ,
AppointmentId"", 9
=="": <
appointmentId""= J
)""J K
;""K L
}## 	
public%% 
async%% 
Task%% 
<%% 
IEnumerable%% %
<%%% &
HealthRecord%%& 2
>%%2 3
>%%3 4
GetByPatientIdAsync%%5 H
(%%H I
int%%I L
	patientId%%M V
)%%V W
{&& 	
return'' 
await'' 
_context'' !
.''! "
HealthRecords''" /
.(( 
Include(( 
((( 
r(( 
=>(( 
r(( 
.((  
Doctor((  &
)((& '
.)) 
Include)) 
()) 
r)) 
=>)) 
r)) 
.))  
Patient))  '
)))' (
.** 
Include** 
(** 
r** 
=>** 
r** 
.**  
Appointment**  +
)**+ ,
.++ 
Where++ 
(++ 
r++ 
=>++ 
r++ 
.++ 
	PatientId++ '
==++( *
	patientId+++ 4
)++4 5
.,, 
OrderByDescending,, "
(,," #
r,,# $
=>,,% '
r,,( )
.,,) *
	CreatedOn,,* 3
),,3 4
.-- 
ToListAsync-- 
(-- 
)-- 
;-- 
}.. 	
public00 
async00 
Task00 
AddAsync00 "
(00" #
HealthRecord00# /
record000 6
)006 7
{11 	
await22 
_context22 
.22 
HealthRecords22 (
.22( )
AddAsync22) 1
(221 2
record222 8
)228 9
;229 :
}33 	
public55 
Task55 
UpdateAsync55 
(55  
HealthRecord55  ,
record55- 3
)553 4
{66 	
_context77 
.77 
HealthRecords77 "
.77" #
Update77# )
(77) *
record77* 0
)770 1
;771 2
return88 
Task88 
.88 
CompletedTask88 %
;88% &
}99 	
public;; 
async;; 
Task;; 
SaveChangesAsync;; *
(;;* +
);;+ ,
{<< 	
await== 
_context== 
.== 
SaveChangesAsync== +
(==+ ,
)==, -
;==- .
}>> 	
}?? 
}@@ ˛@
nC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Repositories\Implementation\DoctorRepository.cs
	namespace 	
S4_HealthAxisApi
 
. 

Repository %
.% &
Implementation& 4
{		 
[

 #
ExcludeFromCodeCoverage

 
]

 
public 

class 
DoctorRepository !
:" #
IDoctorRepository$ 5
{ 
private 
readonly 
HealthAxisDbContext ,
_context- 5
;5 6
public 
DoctorRepository 
(  
HealthAxisDbContext  3
context4 ;
); <
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Doctor& ,
>, -
>- .
GetAllAsync/ :
(: ;
string; A
?A B
sortByC I
,I J
intK N
?N O
specialisationP ^
)^ _
{ 	

IQueryable 
< 
Doctor 
> 
query $
=% &
_context' /
./ 0
Doctors0 7
;7 8
if 
( 
specialisation 
. 
HasValue '
)' (
{ 
if 
( 
! 
Enum 
. 
	IsDefined #
(# $
typeof$ *
(* + 
DoctorSpecialisation+ ?
)? @
,@ A
specialisationB P
.P Q
ValueQ V
)V W
)W X
throw 
new 
ArgumentException /
(/ 0
$str0 P
)P Q
;Q R
var  
doctorSpecialisation (
=) *
(+ , 
DoctorSpecialisation, @
)@ A
specialisationA O
.O P
ValueP U
;U V
query 
= 
query 
. 
Where #
(# $
d$ %
=>& (
d) *
.* +
Specialisation+ 9
==: < 
doctorSpecialisation= Q
)Q R
;R S
} 
query!! 
=!! 
sortBy!! 
?!! 
.!! 
ToLower!! #
(!!# $
)!!$ %
switch!!& ,
{"" 
$str## 
=>## 
query## 
.##  
OrderBy##  '
(##' (
d##( )
=>##* ,
d##- .
.##. /
FullName##/ 7
)##7 8
,##8 9
$str$$ 
=>$$ 
query$$ $
.$$$ %
OrderByDescending$$% 6
($$6 7
d$$7 8
=>$$9 ;
d$$< =
.$$= >
FullName$$> F
)$$F G
,$$G H
$str%% 
=>%% 
query%% 
.%% 
OrderBy%% %
(%%% &
d%%& '
=>%%( *
d%%+ ,
.%%, -
DoctorId%%- 5
)%%5 6
,%%6 7
_&& 
=>&& 
query&& 
.&& 
OrderBy&& "
(&&" #
d&&# $
=>&&% '
d&&( )
.&&) *
DoctorId&&* 2
)&&2 3
}'' 
;'' 
return)) 
await)) 
query)) 
.)) 
ToListAsync)) *
())* +
)))+ ,
;)), -
}** 	
public,, 
async,, 
Task,, 
<,, 
IEnumerable,, %
<,,% &
Doctor,,& ,
>,,, -
>,,- .*
GetActiveBySpecialisationAsync,,/ M
(,,M N
int,,N Q
specialisation,,R `
),,` a
{-- 	
if.. 
(.. 
!.. 
Enum.. 
... 
	IsDefined.. 
(..  
typeof..  &
(..& ' 
DoctorSpecialisation..' ;
)..; <
,..< =
specialisation..> L
)..L M
)..M N
throw// 
new// 
ArgumentException// +
(//+ ,
$str//, L
)//L M
;//M N
var11  
doctorSpecialisation11 $
=11% &
(11' ( 
DoctorSpecialisation11( <
)11< =
specialisation11= K
;11K L
return33 
await33 
_context33 !
.33! "
Doctors33" )
.44 
Where44 
(44 
d44 
=>44 
d44 
.44 
IsActive44 &
&&44' )
d44* +
.44+ ,
Specialisation44, :
==44; = 
doctorSpecialisation44> R
)44R S
.55 
OrderBy55 
(55 
d55 
=>55 
d55 
.55  
FullName55  (
)55( )
.66 
ToListAsync66 
(66 
)66 
;66 
}77 	
public99 
async99 
Task99 
<99 
Doctor99  
?99  !
>99! "
GetByIdAsync99# /
(99/ 0
int990 3
id994 6
)996 7
{:: 	
return;; 
await;; 
_context;; !
.;;! "
Doctors;;" )
.;;) *
	FindAsync;;* 3
(;;3 4
id;;4 6
);;6 7
;;;7 8
}<< 	
public>> 
async>> 
Task>> 
AddAsync>> "
(>>" #
Doctor>># )
doctor>>* 0
)>>0 1
{?? 	
await@@ 
_context@@ 
.@@ 
Doctors@@ "
.@@" #
AddAsync@@# +
(@@+ ,
doctor@@, 2
)@@2 3
;@@3 4
}AA 	
publicCC 
TaskCC 
UpdateAsyncCC 
(CC  
DoctorCC  &
doctorCC' -
)CC- .
{DD 	
_contextEE 
.EE 
DoctorsEE 
.EE 
UpdateEE #
(EE# $
doctorEE$ *
)EE* +
;EE+ ,
returnFF 
TaskFF 
.FF 
CompletedTaskFF %
;FF% &
}GG 	
publicII 
asyncII 
TaskII 
<II 
IEnumerableII %
<II% &
intII& )
>II) *
>II* +
GetBookedSlotsAsyncII, ?
(II? @
intII@ C
doctorIdIID L
,IIL M
DateOnlyIIM U
dateIIV Z
)IIZ [
{JJ 	
returnKK 
awaitKK 
_contextKK !
.KK! "
AppointmentsKK" .
.LL 
WhereLL 
(LL 
aLL 
=>LL 
aMM 
.MM 
DoctorIdMM 
==MM !
doctorIdMM" *
&&MM+ -
aNN 
.NN 
ScheduledDateNN #
==NN$ &
dateNN' +
&&NN, .
aOO 
.OO 
StatusOO 
!=OO 
AppointmentStatusOO  1
.OO1 2
	CancelledOO2 ;
)OO; <
.PP 
SelectPP 
(PP 
aPP 
=>PP 
(PP 
intPP !
)PP! "
aPP" #
.PP# $
TimeSlotPP$ ,
)PP, -
.QQ 
ToListAsyncQQ 
(QQ 
)QQ 
;QQ 
}RR 	
publicTT 
asyncTT 
TaskTT 
<TT 
boolTT 
>TT 
ExistsAsyncTT  +
(TT+ ,
intTT, /
idTT0 2
)TT2 3
{UU 	
returnVV 
awaitVV 
_contextVV !
.VV! "
DoctorsVV" )
.VV) *
AnyAsyncVV* 2
(VV2 3
dVV3 4
=>VV5 7
dVV8 9
.VV9 :
DoctorIdVV: B
==VVC E
idVVF H
)VVH I
;VVI J
}WW 	
publicYY 
asyncYY 
TaskYY 
SaveChangesAsyncYY *
(YY* +
)YY+ ,
{ZZ 	
await[[ 
_context[[ 
.[[ 
SaveChangesAsync[[ +
([[+ ,
)[[, -
;[[- .
}\\ 	
}]] 
}^^ ‚í
sC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Repositories\Implementation\AppointmentRepository.cs
	namespace 	
S4_HealthAxisApi
 
. 

Repository %
.% &
Implementation& 4
{		 
[

 #
ExcludeFromCodeCoverage

 
]

 
public 

class !
AppointmentRepository &
:' ("
IAppointmentRepository) ?
{ 
private 
readonly 
HealthAxisDbContext ,
_context- 5
;5 6
public !
AppointmentRepository $
($ %
HealthAxisDbContext% 8
context9 @
)@ A
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Appointment& 1
>1 2
>2 3
GetAllAsync4 ?
(? @
)@ A
{ 	
return 
await 
_context !
.! "
Appointments" .
. 
Include 
( 
a 
=> 
a 
.  
Patient  '
)' (
. 
Include 
( 
a 
=> 
a 
.  
Doctor  &
)& '
. 
Include 
( 
a 
=> 
a 
.  
HealthRecord  ,
), -
. 
OrderByDescending "
(" #
a# $
=>% '
a( )
.) *
ScheduledDate* 7
)7 8
. 
ThenBy 
( 
a 
=> 
a 
. 
TimeSlot '
)' (
. 
ToListAsync 
( 
) 
; 
} 	
public 
async 
Task 
< 
Appointment %
?% &
>& '
GetByIdAsync( 4
(4 5
int5 8
id9 ;
); <
{   	
return!! 
await!! 
_context!! !
.!!! "
Appointments!!" .
."" 
Include"" 
("" 
a"" 
=>"" 
a"" 
.""  
Patient""  '
)""' (
.## 
Include## 
(## 
a## 
=>## 
a## 
.##  
Doctor##  &
)##& '
.$$ 
Include$$ 
($$ 
a$$ 
=>$$ 
a$$ 
.$$  
HealthRecord$$  ,
)$$, -
.%% 
FirstOrDefaultAsync%% $
(%%$ %
a%%% &
=>%%' )
a%%* +
.%%+ ,
AppointmentId%%, 9
==%%: <
id%%= ?
)%%? @
;%%@ A
}&& 	
public(( 
async(( 
Task(( 
<(( 
IEnumerable(( %
<((% &
Appointment((& 1
>((1 2
>((2 3
GetByPatientIdAsync((4 G
(((G H
int((H K
	patientId((L U
)((U V
{)) 	
return** 
await** 
_context** !
.**! "
Appointments**" .
.++ 
Include++ 
(++ 
a++ 
=>++ 
a++ 
.++  
Doctor++  &
)++& '
.,, 
Include,, 
(,, 
a,, 
=>,, 
a,, 
.,,  
HealthRecord,,  ,
),,, -
.-- 
Where-- 
(-- 
a-- 
=>-- 
a-- 
.-- 
	PatientId-- '
==--( *
	patientId--+ 4
)--4 5
... 
OrderByDescending.. "
(.." #
a..# $
=>..% '
a..( )
...) *
ScheduledDate..* 7
)..7 8
.// 
ThenBy// 
(// 
a// 
=>// 
a// 
.// 
TimeSlot// '
)//' (
.00 
ToListAsync00 
(00 
)00 
;00 
}11 	
public33 
async33 
Task33 
<33 
IEnumerable33 %
<33% &
Appointment33& 1
>331 2
>332 3'
GetDoctorTodayScheduleAsync334 O
(33O P
int33P S
doctorId33T \
,33\ ]
DateOnly33^ f
today33g l
)33l m
{44 	
return55 
await55 
_context55 !
.55! "
Appointments55" .
.66 
Include66 
(66 
a66 
=>66 
a66 
.66  
Patient66  '
)66' (
.77 
Include77 
(77 
a77 
=>77 
a77 
.77  
HealthRecord77  ,
)77, -
.88 
Where88 
(88 
a88 
=>88 
a88 
.88 
DoctorId88 &
==88' )
doctorId88* 2
&&883 5
a886 7
.887 8
ScheduledDate888 E
==88F H
today88I N
)88N O
.99 
OrderBy99 
(99 
a99 
=>99 
a99 
.99  
TimeSlot99  (
)99( )
.:: 
ToListAsync:: 
(:: 
):: 
;:: 
};; 	
public== 
async== 
Task== 
<== 
IEnumerable== %
<==% &
Appointment==& 1
>==1 2
>==2 3&
GetDoctorWeekScheduleAsync==4 N
(==N O
int==O R
doctorId==S [
,==[ \
DateOnly==] e
	startDate==f o
,==o p
DateOnly==q y
endDate	==z Å
)
==Å Ç
{>> 	
return?? 
await?? 
_context?? !
.??! "
Appointments??" .
.@@ 
Include@@ 
(@@ 
a@@ 
=>@@ 
a@@ 
.@@  
Patient@@  '
)@@' (
.AA 
IncludeAA 
(AA 
aAA 
=>AA 
aAA 
.AA  
HealthRecordAA  ,
)AA, -
.BB 
WhereBB 
(BB 
aBB 
=>BB 
aCC 
.CC 
DoctorIdCC 
==CC !
doctorIdCC" *
&&CC+ -
aDD 
.DD 
ScheduledDateDD #
>=DD$ &
	startDateDD' 0
&&DD1 3
aEE 
.EE 
ScheduledDateEE #
<=EE$ &
endDateEE' .
)EE. /
.FF 
OrderByFF 
(FF 
aFF 
=>FF 
aFF 
.FF  
ScheduledDateFF  -
)FF- .
.GG 
ThenByGG 
(GG 
aGG 
=>GG 
aGG 
.GG 
TimeSlotGG '
)GG' (
.HH 
ToListAsyncHH 
(HH 
)HH 
;HH 
}II 	
publicKK 
asyncKK 
TaskKK 
<KK 
boolKK 
>KK 4
(ExistsSamePatientSameDoctorSameDateAsyncKK  H
(KKH I
intLL 
	patientIdLL 
,LL 
intMM 
doctorIdMM 
,MM 
DateOnlyNN 
dateNN 
)NN 
{OO 	
returnPP 
awaitPP 
_contextPP !
.PP! "
AppointmentsPP" .
.PP. /
AnyAsyncPP/ 7
(PP7 8
aPP8 9
=>PP: <
aQQ 
.QQ 
	PatientIdQQ 
==QQ 
	patientIdQQ (
&&QQ) +
aRR 
.RR 
DoctorIdRR 
==RR 
doctorIdRR &
&&RR' )
aSS 
.SS 
ScheduledDateSS 
==SS  "
dateSS# '
&&SS( *
aTT 
.TT 
StatusTT 
!=TT 
AppointmentStatusTT -
.TT- .
	CancelledTT. 7
)TT7 8
;TT8 9
}UU 	
publicWW 
asyncWW 
TaskWW 
<WW 
boolWW 
>WW 2
&ExistsSamePatientSameSlotSameDateAsyncWW  F
(WWF G
intXX 
	patientIdXX 
,XX 
DateOnlyYY 
dateYY 
,YY 
intZZ 
timeSlotZZ 
)ZZ 
{[[ 	
if\\ 
(\\ 
!\\ 
Enum\\ 
.\\ 
	IsDefined\\ 
(\\  
typeof\\  &
(\\& '
AppointmentTimeSlot\\' :
)\\: ;
,\\; <
timeSlot\\= E
)\\E F
)\\F G
throw]] 
new]] 
ArgumentException]] +
(]]+ ,
$str]], L
)]]L M
;]]M N
var__ 
slotEnum__ 
=__ 
(__ 
AppointmentTimeSlot__ /
)__/ 0
timeSlot__0 8
;__8 9
returnaa 
awaitaa 
_contextaa !
.aa! "
Appointmentsaa" .
.aa. /
AnyAsyncaa/ 7
(aa7 8
aaa8 9
=>aa: <
abb 
.bb 
	PatientIdbb 
==bb 
	patientIdbb (
&&bb) +
acc 
.cc 
ScheduledDatecc 
==cc  "
datecc# '
&&cc( *
add 
.dd 
TimeSlotdd 
==dd 
slotEnumdd &
&&dd' )
aee 
.ee 
Statusee 
!=ee 
AppointmentStatusee -
.ee- .
	Cancelledee. 7
)ee7 8
;ee8 9
}ff 	
publichh 
asynchh 
Taskhh 
<hh 
boolhh 
>hh 1
%ExistsSameDoctorSameSlotSameDateAsynchh  E
(hhE F
intii 
doctorIdii 
,ii 
DateOnlyjj 
datejj 
,jj 
intkk 
timeSlotkk 
)kk 
{ll 	
ifmm 
(mm 
!mm 
Enummm 
.mm 
	IsDefinedmm 
(mm  
typeofmm  &
(mm& '
AppointmentTimeSlotmm' :
)mm: ;
,mm; <
timeSlotmm= E
)mmE F
)mmF G
thrownn 
newnn 
ArgumentExceptionnn +
(nn+ ,
$strnn, L
)nnL M
;nnM N
varpp 
slotEnumpp 
=pp 
(pp 
AppointmentTimeSlotpp /
)pp/ 0
timeSlotpp0 8
;pp8 9
returnrr 
awaitrr 
_contextrr !
.rr! "
Appointmentsrr" .
.rr. /
AnyAsyncrr/ 7
(rr7 8
arr8 9
=>rr: <
ass 
.ss 
DoctorIdss 
==ss 
doctorIdss &
&&ss' )
att 
.tt 
ScheduledDatett 
==tt  "
datett# '
&&tt( *
auu 
.uu 
TimeSlotuu 
==uu 
slotEnumuu &
&&uu' )
avv 
.vv 
Statusvv 
!=vv 
AppointmentStatusvv -
.vv- .
	Cancelledvv. 7
)vv7 8
;vv8 9
}ww 	
publicyy 
asyncyy 
Taskyy 
<yy 
boolyy 
>yy 4
(ExistsSamePatientSameDoctorSameDateAsyncyy  H
(yyH I
intzz 
	patientIdzz 
,zz 
int{{ 
doctorId{{ 
,{{ 
DateOnly|| 
date|| 
,|| 
int}} 
appointmentId}} 
)}} 
{~~ 	
return 
await 
_context !
.! "
Appointments" .
.. /
AnyAsync/ 7
(7 8
a8 9
=>: <
a
ÄÄ 
.
ÄÄ 
AppointmentId
ÄÄ 
!=
ÄÄ  "
appointmentId
ÄÄ# 0
&&
ÄÄ1 3
a
ÅÅ 
.
ÅÅ 
	PatientId
ÅÅ 
==
ÅÅ 
	patientId
ÅÅ (
&&
ÅÅ) +
a
ÇÇ 
.
ÇÇ 
DoctorId
ÇÇ 
==
ÇÇ 
doctorId
ÇÇ &
&&
ÇÇ' )
a
ÉÉ 
.
ÉÉ 
ScheduledDate
ÉÉ 
==
ÉÉ  "
date
ÉÉ# '
&&
ÉÉ( *
a
ÑÑ 
.
ÑÑ 
Status
ÑÑ 
!=
ÑÑ 
AppointmentStatus
ÑÑ -
.
ÑÑ- .
	Cancelled
ÑÑ. 7
)
ÑÑ7 8
;
ÑÑ8 9
}
ÖÖ 	
public
áá 
async
áá 
Task
áá 
<
áá 
bool
áá 
>
áá 4
&ExistsSamePatientSameSlotSameDateAsync
áá  F
(
ááF G
int
àà 
	patientId
àà 
,
àà 
DateOnly
ââ 
date
ââ 
,
ââ 
int
ää 
timeSlot
ää 
,
ää 
int
ãã 
appointmentId
ãã 
)
ãã 
{
åå 	
return
çç 
await
çç 
_context
çç !
.
çç! "
Appointments
çç" .
.
çç. /
AnyAsync
çç/ 7
(
çç7 8
a
çç8 9
=>
çç: <
a
éé 
.
éé 
AppointmentId
éé 
!=
éé  "
appointmentId
éé# 0
&&
éé1 3
a
èè 
.
èè 
	PatientId
èè 
==
èè 
	patientId
èè (
&&
èè) +
a
êê 
.
êê 
ScheduledDate
êê 
==
êê  "
date
êê# '
&&
êê( *
(
ëë 
int
ëë 
)
ëë 
a
ëë 
.
ëë 
TimeSlot
ëë 
==
ëë  "
timeSlot
ëë# +
&&
ëë, .
a
íí 
.
íí 
Status
íí 
!=
íí 
AppointmentStatus
íí -
.
íí- .
	Cancelled
íí. 7
)
íí7 8
;
íí8 9
}
ìì 	
public
ïï 
async
ïï 
Task
ïï 
<
ïï 
bool
ïï 
>
ïï 3
%ExistsSameDoctorSameSlotSameDateAsync
ïï  E
(
ïïE F
int
ññ 
doctorId
ññ 
,
ññ 
DateOnly
óó 
date
óó 
,
óó 
int
òò 
timeSlot
òò 
,
òò 
int
ôô 
appointmentId
ôô 
)
ôô 
{
öö 	
return
õõ 
await
õõ 
_context
õõ !
.
õõ! "
Appointments
õõ" .
.
õõ. /
AnyAsync
õõ/ 7
(
õõ7 8
a
õõ8 9
=>
õõ: <
a
úú 
.
úú 
AppointmentId
úú 
!=
úú  "
appointmentId
úú# 0
&&
úú1 3
a
ùù 
.
ùù 
DoctorId
ùù 
==
ùù 
doctorId
ùù &
&&
ùù' )
a
ûû 
.
ûû 
ScheduledDate
ûû 
==
ûû  "
date
ûû# '
&&
ûû( *
(
üü 
int
üü 
)
üü 
a
üü 
.
üü 
TimeSlot
üü 
==
üü  "
timeSlot
üü# +
&&
üü, .
a
†† 
.
†† 
Status
†† 
!=
†† 
AppointmentStatus
†† -
.
††- .
	Cancelled
††. 7
)
††7 8
;
††8 9
}
°° 	
public
££ 
async
££ 
Task
££ 
AddAsync
££ "
(
££" #
Appointment
££# .
appointment
££/ :
)
££: ;
{
§§ 	
await
•• 
_context
•• 
.
•• 
Appointments
•• '
.
••' (
AddAsync
••( 0
(
••0 1
appointment
••1 <
)
••< =
;
••= >
}
¶¶ 	
public
®® 
Task
®® 
UpdateAsync
®® 
(
®®  
Appointment
®®  +
appointment
®®, 7
)
®®7 8
{
©© 	
_context
™™ 
.
™™ 
Appointments
™™ !
.
™™! "
Update
™™" (
(
™™( )
appointment
™™) 4
)
™™4 5
;
™™5 6
return
´´ 
Task
´´ 
.
´´ 
CompletedTask
´´ %
;
´´% &
}
¨¨ 	
public
ÆÆ 
async
ÆÆ 
Task
ÆÆ 
<
ÆÆ 
bool
ÆÆ 
>
ÆÆ 
ExistsAsync
ÆÆ  +
(
ÆÆ+ ,
int
ÆÆ, /
id
ÆÆ0 2
)
ÆÆ2 3
{
ØØ 	
return
∞∞ 
await
∞∞ 
_context
∞∞ !
.
∞∞! "
Appointments
∞∞" .
.
∞∞. /
AnyAsync
∞∞/ 7
(
∞∞7 8
a
∞∞8 9
=>
∞∞: <
a
±± 
.
±± 
AppointmentId
±± 
==
±±  "
id
±±# %
)
±±% &
;
±±& '
}
≤≤ 	
public
¥¥ 
async
¥¥ 
Task
¥¥ 
<
¥¥ 
IEnumerable
¥¥ %
<
¥¥% &
Appointment
¥¥& 1
>
¥¥1 2
>
¥¥2 3/
!GetDoctorPatientAppointmentsAsync
¥¥4 U
(
¥¥U V
int
µµ 
doctorId
µµ 
)
µµ 
{
∂∂ 	
return
∑∑ 
await
∑∑ 
_context
∑∑ !
.
∑∑! "
Appointments
∑∑" .
.
∏∏ 
Include
∏∏ 
(
∏∏ 
a
∏∏ 
=>
∏∏ 
a
∏∏ 
.
∏∏  
Patient
∏∏  '
)
∏∏' (
.
ππ 
Include
ππ 
(
ππ 
a
ππ 
=>
ππ 
a
ππ 
.
ππ  
HealthRecord
ππ  ,
)
ππ, -
.
∫∫ 
Where
∫∫ 
(
∫∫ 
a
∫∫ 
=>
∫∫ 
a
∫∫ 
.
∫∫ 
DoctorId
∫∫ &
==
∫∫' )
doctorId
∫∫* 2
)
∫∫2 3
.
ªª 
OrderByDescending
ªª "
(
ªª" #
a
ªª# $
=>
ªª% '
a
ªª( )
.
ªª) *
ScheduledDate
ªª* 7
)
ªª7 8
.
ºº 
ThenBy
ºº 
(
ºº 
a
ºº 
=>
ºº 
a
ºº 
.
ºº 
TimeSlot
ºº '
)
ºº' (
.
ΩΩ 
ToListAsync
ΩΩ 
(
ΩΩ 
)
ΩΩ 
;
ΩΩ 
}
ææ 	
public
¿¿ 
async
¿¿ 
Task
¿¿ 
SaveChangesAsync
¿¿ *
(
¿¿* +
)
¿¿+ ,
{
¡¡ 	
await
¬¬ 
_context
¬¬ 
.
¬¬ 
SaveChangesAsync
¬¬ +
(
¬¬+ ,
)
¬¬, -
;
¬¬- .
}
√√ 	
}
ƒƒ 
}≈≈ ‹<
mC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Repositories\Implementation\AdminRepository.cs
	namespace 	
S4_HealthAxisApi
 
. 

Repository %
.% &
Implementation& 4
{		 
[

 #
ExcludeFromCodeCoverage

 
]

 
public 

class 
AdminRepository  
:! "
IAdminRepository# 3
{ 
private 
readonly 
HealthAxisDbContext ,
_context- 5
;5 6
public 
AdminRepository 
( 
HealthAxisDbContext 2
context3 :
): ;
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
int 
> 
CountPatientsAsync 1
(1 2
)2 3
{ 	
return 
await 
_context !
.! "
Patients" *
.* +

CountAsync+ 5
(5 6
)6 7
;7 8
} 	
public 
async 
Task 
< 
int 
> $
CountActivePatientsAsync 7
(7 8
)8 9
{ 	
return 
await 
_context !
.! "
Patients" *
.* +

CountAsync+ 5
(5 6
p6 7
=>8 :
p; <
.< =
IsActive= E
)E F
;F G
} 	
public 
async 
Task 
< 
int 
> 
CountDoctorsAsync 0
(0 1
)1 2
{ 	
return   
await   
_context   !
.  ! "
Doctors  " )
.  ) *

CountAsync  * 4
(  4 5
)  5 6
;  6 7
}!! 	
public## 
async## 
Task## 
<## 
int## 
>## #
CountActiveDoctorsAsync## 6
(##6 7
)##7 8
{$$ 	
return%% 
await%% 
_context%% !
.%%! "
Doctors%%" )
.%%) *

CountAsync%%* 4
(%%4 5
d%%5 6
=>%%7 9
d%%: ;
.%%; <
IsActive%%< D
)%%D E
;%%E F
}&& 	
public(( 
async(( 
Task(( 
<(( 
int(( 
>(( '
CountTodayAppointmentsAsync(( :
(((: ;
)((; <
{)) 	
var** 
today** 
=** 
DateOnly**  
.**  !
FromDateTime**! -
(**- .
DateTime**. 6
.**6 7
Today**7 <
)**< =
;**= >
return,, 
await,, 
_context,, !
.,,! "
Appointments,," .
.,,. /

CountAsync,,/ 9
(,,9 :
a,,: ;
=>,,< >
a,,? @
.,,@ A
ScheduledDate,,A N
==,,O Q
today,,R W
),,W X
;,,X Y
}-- 	
public// 
async// 
Task// 
<// 
int// 
>// )
CountPendingAppointmentsAsync// <
(//< =
)//= >
{00 	
return11 
await11 
_context11 !
.11! "
Appointments11" .
.11. /

CountAsync11/ 9
(119 :
a11: ;
=>11< >
a11? @
.11@ A
Status11A G
==11H J
AppointmentStatus11K \
.11\ ]
Pending11] d
)11d e
;11e f
}22 	
public44 
async44 
Task44 
<44 
int44 
>44 +
CountCompletedAppointmentsAsync44 >
(44> ?
)44? @
{55 	
return66 
await66 
_context66 !
.66! "
Appointments66" .
.66. /

CountAsync66/ 9
(669 :
a66: ;
=>66< >
a66? @
.66@ A
Status66A G
==66H J
AppointmentStatus66K \
.66\ ]
	Completed66] f
)66f g
;66g h
}77 	
public99 
async99 
Task99 
<99 
int99 
>99 #
CountHealthRecordsAsync99 6
(996 7
)997 8
{:: 	
return;; 
await;; 
_context;; !
.;;! "
HealthRecords;;" /
.;;/ 0

CountAsync;;0 :
(;;: ;
);;; <
;;;< =
}<< 	
public>> 
async>> 
Task>> 
<>> 
IEnumerable>> %
<>>% &
User>>& *
>>>* +
>>>+ ,
GetUsersAsync>>- :
(>>: ;
)>>; <
{?? 	
return@@ 
await@@ 
_context@@ !
.@@! "
AppUsers@@" *
.@@* +
ToListAsync@@+ 6
(@@6 7
)@@7 8
;@@8 9
}AA 	
publicCC 
asyncCC 
TaskCC 
<CC 
UserCC 
?CC 
>CC  
GetUserByIdAsyncCC! 1
(CC1 2
intCC2 5
idCC6 8
)CC8 9
{DD 	
returnEE 
awaitEE 
_contextEE !
.EE! "
AppUsersEE" *
.EE* +
FirstOrDefaultAsyncEE+ >
(EE> ?
uEE? @
=>EEA C
uEED E
.EEE F
UserIdEEF L
==EEM O
idEEP R
)EER S
;EES T
}FF 	
publicHH 
asyncHH 
TaskHH 
<HH 
boolHH 
>HH (
ResolveUserActiveStatusAsyncHH  <
(HH< =
stringHH= C
emailHHD I
,HHI J
stringHHK Q
roleHHR V
)HHV W
{II 	
ifJJ 
(JJ 
stringJJ 
.JJ 
IsNullOrWhiteSpaceJJ )
(JJ) *
emailJJ* /
)JJ/ 0
||JJ1 3
stringJJ4 :
.JJ: ;
IsNullOrWhiteSpaceJJ; M
(JJM N
roleJJN R
)JJR S
)JJS T
returnKK 
falseKK 
;KK 
switchMM 
(MM 
roleMM 
.MM 
TrimMM 
(MM 
)MM 
.MM  
ToLowerInvariantMM  0
(MM0 1
)MM1 2
)MM2 3
{NN 
caseOO 
$strOO 
:OO 
returnPP 
truePP 
;PP  
caseRR 
$strRR 
:RR 
returnSS 
awaitSS  
_contextSS! )
.SS) *
DoctorsSS* 1
.TT 
AsNoTrackingTT %
(TT% &
)TT& '
.UU 
AnyAsyncUU !
(UU! "
dUU" #
=>UU$ &
dUU' (
.UU( )
EmailUU) .
==UU/ 1
emailUU2 7
&&UU8 :
dUU; <
.UU< =
IsActiveUU= E
)UUE F
;UUF G
caseWW 
$strWW 
:WW 
returnXX 
awaitXX  
_contextXX! )
.XX) *
PatientsXX* 2
.YY 
AsNoTrackingYY %
(YY% &
)YY& '
.ZZ 
AnyAsyncZZ !
(ZZ! "
pZZ" #
=>ZZ$ &
pZZ' (
.ZZ( )
EmailZZ) .
==ZZ/ 1
emailZZ2 7
&&ZZ8 :
pZZ; <
.ZZ< =
IsActiveZZ= E
)ZZE F
;ZZF G
default\\ 
:\\ 
return]] 
false]]  
;]]  !
}^^ 
}__ 	
}`` 
}aa §!
oC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Repositories\Implementation\GenericRepository.cs
	namespace 	
S4_HealthAxisApi
 
. 

Repository %
.% &
Implementation& 4
{ 
[ #
ExcludeFromCodeCoverage 
] 
public		 

class		 
GenericRepository		 "
<		" #
T		# $
>		$ %
:		& '
IGenericRepository		( :
<		: ;
T		; <
>		< =
where

 
T

 
:

 
class

 
{ 
	protected 
readonly 
HealthAxisDbContext .
_context/ 7
;7 8
	protected 
readonly 
DbSet  
<  !
T! "
>" #
_dbSet$ *
;* +
public 
GenericRepository  
(  !
HealthAxisDbContext! 4
context5 <
)< =
{ 	
_context 
= 
context 
; 
_dbSet 
= 
context 
. 
Set  
<  !
T! "
>" #
(# $
)$ %
;% &
} 	
public 
virtual 
async 
Task !
<! "
IEnumerable" -
<- .
T. /
>/ 0
>0 1
GetAllAsync2 =
(= >
)> ?
{ 	
return 
await 
_dbSet 
.  
ToListAsync  +
(+ ,
), -
;- .
} 	
public 
virtual 
async 
Task !
<! "
T" #
?# $
>$ %
GetByIdAsync& 2
(2 3
int3 6
id7 9
)9 :
{ 	
return 
await 
_dbSet 
.  
	FindAsync  )
() *
id* ,
), -
;- .
} 	
public 
virtual 
async 
Task !
AddAsync" *
(* +
T+ ,
entity- 3
)3 4
{   	
await!! 
_dbSet!! 
.!! 
AddAsync!! !
(!!! "
entity!!" (
)!!( )
;!!) *
await"" 
_context"" 
."" 
SaveChangesAsync"" +
(""+ ,
)"", -
;""- .
}## 	
public%% 
virtual%% 
async%% 
Task%% !
UpdateAsync%%" -
(%%- .
T%%. /
entity%%0 6
)%%6 7
{&& 	
_dbSet'' 
.'' 
Update'' 
('' 
entity''  
)''  !
;''! "
await(( 
_context(( 
.(( 
SaveChangesAsync(( +
(((+ ,
)((, -
;((- .
})) 	
public++ 
virtual++ 
async++ 
Task++ !
DeleteAsync++" -
(++- .
int++. 1
id++2 4
)++4 5
{,, 	
var-- 
entity-- 
=-- 
await-- 
_dbSet-- %
.--% &
	FindAsync--& /
(--/ 0
id--0 2
)--2 3
;--3 4
if// 
(// 
entity// 
!=// 
null// 
)// 
{00 
_dbSet11 
.11 
Remove11 
(11 
entity11 $
)11$ %
;11% &
await22 
_context22 
.22 
SaveChangesAsync22 /
(22/ 0
)220 1
;221 2
}33 
}44 	
public66 
virtual66 
async66 
Task66 !
<66! "
bool66" &
>66& '
ExistsAsync66( 3
(663 4
int664 7
id668 :
)66: ;
{77 	
return88 
await88 
_dbSet88 
.88  
	FindAsync88  )
(88) *
id88* ,
)88, -
!=88. 0
null881 5
;885 6
}99 	
}:: 
};; ∞ñ
IC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder 
. 
Host 
. 

UseSerilog 
( 
( 
context  
,  !
services" *
,* +
configuration, 9
)9 :
=>; =
{ 
var 
elasticSection 
= 
context 
. 
Configuration 
. 

GetSection (
(( )
$str) 8
)8 9
;9 :
var   
elasticEnabled   
=   
bool!! 
.!! 
TryParse!! 
(!! 
elasticSection!! $
[!!$ %
$str!!% .
]!!. /
,!!/ 0
out!!1 4
var!!5 8
enabled!!9 @
)!!@ A
&&!!B D
enabled"" 
;"" 
var$$ 

elasticUri$$ 
=$$ 
elasticSection%% 
[%% 
$str%% 
]%% 
;%% 
var'' 
dataStreamDataset'' 
='' 
elasticSection(( 
[(( 
$str(( *
]((* +
??((, .
$str((/ ?
;((? @
var** 
dataStreamNamespace** 
=** 
elasticSection++ 
[++ 
$str++ ,
]++, -
??++. 0
$str++1 8
;++8 9
const-- 	
string--
 
outputTemplate-- 
=--  !
$str.. _
;.._ `
configuration00 
.11 	
ReadFrom11	 
.11 
Configuration11 
(11  
context11  '
.11' (
Configuration11( 5
)115 6
.22 	
ReadFrom22	 
.22 
Services22 
(22 
services22 #
)22# $
.33 	
Enrich33	 
.33 
FromLogContext33 
(33 
)33  
.44 	
Enrich44	 
.44 
WithProperty44 
(44 
$str44 *
,44* +
$str44, >
)44> ?
.55 	
WriteTo55	 
.55 
Console55 
(55 
outputTemplate55 '
:55' (
outputTemplate55) 7
)557 8
.66 	
WriteTo66	 
.66 
File66 
(66 
$str77 "
,77" #
rollingInterval88 
:88 
RollingInterval88 ,
.88, -
Day88- 0
,880 1"
retainedFileCountLimit99 "
:99" #
$num99$ %
,99% &
outputTemplate:: 
::: 
outputTemplate:: *
)::* +
;::+ ,
if<< 
(<< 
elasticEnabled<< 
&&<< 
!== 	
string==	 
.== 
IsNullOrWhiteSpace== "
(==" #

elasticUri==# -
)==- .
)==. /
{>> 
configuration?? 
.?? 
WriteTo?? 
.?? 
Elasticsearch?? +
(??+ ,
new@@ 
[@@ 
]@@ 
{@@ 
new@@ 
Uri@@ 
(@@ 

elasticUri@@ &
)@@& '
}@@( )
,@@) *
optionsAA 
=>AA 
{BB 
optionsCC 
.CC 

DataStreamCC "
=CC# $
newDD 
DataStreamNameDD &
(DD& '
$strEE 
,EE 
dataStreamDatasetFF )
,FF) *
dataStreamNamespaceGG +
)GG+ ,
;GG, -
optionsII 
.II 
BootstrapMethodII '
=II( )
BootstrapMethodJJ #
.JJ# $
SilentJJ$ *
;JJ* +
}KK 
)KK 
;KK 
}LL 
}MM 
)MM 
;MM 
builderSS 
.SS 
ServicesSS 
.TT 
AddControllersTT 
(TT 
)TT 
.UU 
AddJsonOptionsUU 
(UU 
optionsUU 
=>UU 
{VV 
optionsWW 
.WW !
JsonSerializerOptionsWW %
.WW% & 
PropertyNamingPolicyWW& :
=WW; <
JsonNamingPolicyXX 
.XX 
	CamelCaseXX &
;XX& '
}YY 
)YY 
;YY 
builder__ 
.__ 
Services__ 
.__ #
AddEndpointsApiExplorer__ (
(__( )
)__) *
;__* +
builderaa 
.aa 
Servicesaa 
.aa 
AddSwaggerGenaa 
(aa 
optionsaa &
=>aa' )
{bb 
optionscc 
.cc 

SwaggerDoccc 
(cc 
$strdd 
,dd 
newee 
OpenApiInfoee 
{ff 	
Titlegg 
=gg 
$strgg $
,gg$ %
Versionhh 
=hh 
$strhh 
,hh 
Descriptionii 
=ii 
$strii A
}jj 	
)jj	 

;jj
 
optionsll 
.ll !
AddSecurityDefinitionll !
(ll! "
$strmm 
,mm 
newnn !
OpenApiSecuritySchemenn !
{oo 	
Namepp 
=pp 
$strpp "
,pp" #
Inqq 
=qq 
ParameterLocationqq "
.qq" #
Headerqq# )
,qq) *
Typerr 
=rr 
SecuritySchemeTyperr %
.rr% &
Httprr& *
,rr* +
Schemess 
=ss 
$strss 
,ss 
BearerFormattt 
=tt 
$strtt  
,tt  !
Descriptionuu 
=uu 
$strvv M
}ww 	
)ww	 

;ww
 
optionsyy 
.yy "
AddSecurityRequirementyy "
(yy" #
documentyy# +
=>yy, .
newzz &
OpenApiSecurityRequirementzz &
{{{ 	
[|| 
new|| *
OpenApiSecuritySchemeReference|| /
(||/ 0
$str}} 
,}} 
document~~ 
)~~ 
]~~ 
=~~ 
[~~ 
]~~ 
} 	
)	 

;
 
}ÄÄ 
)
ÄÄ 
;
ÄÄ 
builderÜÜ 
.
ÜÜ 
Services
ÜÜ 
.
ÜÜ 
AddDbContext
ÜÜ 
<
ÜÜ !
HealthAxisDbContext
ÜÜ 1
>
ÜÜ1 2
(
ÜÜ2 3
options
ÜÜ3 :
=>
ÜÜ; =
{áá 
options
àà 
.
àà 
UseSqlServer
àà 
(
àà 
builder
ââ 
.
ââ 
Configuration
ââ 
.
ââ !
GetConnectionString
ââ 1
(
ââ1 2
$str
ââ2 E
)
ââE F
)
ââF G
;
ââG H
}ää 
)
ää 
;
ää 
builderêê 
.
êê 
Services
êê 
.
êê (
AddStackExchangeRedisCache
êê +
(
êê+ ,
options
êê, 3
=>
êê4 6
{ëë 
options
íí 
.
íí 
Configuration
íí 
=
íí 
builder
ìì 
.
ìì 
Configuration
ìì 
.
ìì 

GetSection
ìì (
(
ìì( )
$str
ìì) 1
)
ìì1 2
[
ìì2 3
$str
ìì3 E
]
ììE F
;
ììF G
options
ïï 
.
ïï 
InstanceName
ïï 
=
ïï 
builder
ññ 
.
ññ 
Configuration
ññ 
.
ññ 

GetSection
ññ (
(
ññ( )
$str
ññ) 1
)
ññ1 2
[
ññ2 3
$str
ññ3 A
]
ññA B
??
ññC E
$str
óó 
;
óó 
}òò 
)
òò 
;
òò 
builderûû 
.
ûû 
Services
ûû 
.
üü 
AddAuthentication
üü 
(
üü 
JwtBearerDefaults
üü (
.
üü( )"
AuthenticationScheme
üü) =
)
üü= >
.
†† 
AddJwtBearer
†† 
(
†† 
options
†† 
=>
†† 
{
°° 
var
¢¢ 
jwt
¢¢ 
=
¢¢ 
builder
££ 
.
££ 
Configuration
££ !
.
££! "

GetSection
££" ,
(
££, -
$str
££- 2
)
££2 3
;
££3 4
options
•• 
.
•• '
TokenValidationParameters
•• )
=
••* +
new
¶¶ '
TokenValidationParameters
¶¶ )
{
ßß 
ValidateIssuer
®® 
=
®®  
true
®®! %
,
®®% &
ValidIssuer
©© 
=
©© 
jwt
©© !
[
©©! "
$str
©©" *
]
©©* +
,
©©+ ,
ValidateAudience
´´  
=
´´! "
true
´´# '
,
´´' (
ValidAudience
¨¨ 
=
¨¨ 
jwt
¨¨  #
[
¨¨# $
$str
¨¨$ .
]
¨¨. /
,
¨¨/ 0
ValidateLifetime
ÆÆ  
=
ÆÆ! "
true
ÆÆ# '
,
ÆÆ' (&
ValidateIssuerSigningKey
∞∞ (
=
∞∞) *
true
∞∞+ /
,
∞∞/ 0
IssuerSigningKey
≤≤  
=
≤≤! "
new
≥≥ "
SymmetricSecurityKey
≥≥ ,
(
≥≥, -
Encoding
¥¥  
.
¥¥  !
UTF8
¥¥! %
.
¥¥% &
GetBytes
¥¥& .
(
¥¥. /
jwt
¥¥/ 2
[
¥¥2 3
$str
¥¥3 8
]
¥¥8 9
!
¥¥9 :
)
¥¥: ;
)
¥¥; <
,
¥¥< =
	ClockSkew
∂∂ 
=
∂∂ 
TimeSpan
∂∂ $
.
∂∂$ %
Zero
∂∂% )
}
∑∑ 
;
∑∑ 
}
∏∏ 
)
∏∏ 
;
∏∏ 
builder∫∫ 
.
∫∫ 
Services
∫∫ 
.
∫∫ 
AddAuthorization
∫∫ !
(
∫∫! "
)
∫∫" #
;
∫∫# $
builder¿¿ 
.
¿¿ 
Services
¿¿ 
.
¿¿ 
AddCors
¿¿ 
(
¿¿ 
options
¿¿  
=>
¿¿! #
{¡¡ 
options
¬¬ 
.
¬¬ 
	AddPolicy
¬¬ 
(
¬¬ 
$str
√√ 
,
√√ 
policy
ƒƒ 
=>
ƒƒ 
{
≈≈ 	
policy
∆∆ 
.
«« 
WithOrigins
«« 
(
«« 
$str
»» ,
,
»», -
$str
…… +
)
……+ ,
.
   
AllowAnyHeader
   
(
    
)
    !
.
ÀÀ 
AllowAnyMethod
ÀÀ 
(
ÀÀ  
)
ÀÀ  !
;
ÀÀ! "
}
ÃÃ 	
)
ÃÃ	 

;
ÃÃ
 
}ÕÕ 
)
ÕÕ 
;
ÕÕ 
builder”” 
.
”” 
Services
”” 
.
”” 
	AddScoped
”” 
<
””  
IPatientRepository
”” -
,
””- .
PatientRepository
””/ @
>
””@ A
(
””A B
)
””B C
;
””C D
builder‘‘ 
.
‘‘ 
Services
‘‘ 
.
‘‘ 
	AddScoped
‘‘ 
<
‘‘ 
IDoctorRepository
‘‘ ,
,
‘‘, -
DoctorRepository
‘‘. >
>
‘‘> ?
(
‘‘? @
)
‘‘@ A
;
‘‘A B
builder’’ 
.
’’ 
Services
’’ 
.
’’ 
	AddScoped
’’ 
<
’’ $
IAppointmentRepository
’’ 1
,
’’1 2#
AppointmentRepository
’’3 H
>
’’H I
(
’’I J
)
’’J K
;
’’K L
builder÷÷ 
.
÷÷ 
Services
÷÷ 
.
÷÷ 
	AddScoped
÷÷ 
<
÷÷ %
IHealthRecordRepository
÷÷ 2
,
÷÷2 3$
HealthRecordRepository
÷÷4 J
>
÷÷J K
(
÷÷K L
)
÷÷L M
;
÷÷M N
builder◊◊ 
.
◊◊ 
Services
◊◊ 
.
◊◊ 
	AddScoped
◊◊ 
<
◊◊ 
IUserRepository
◊◊ *
,
◊◊* +
UserRepository
◊◊, :
>
◊◊: ;
(
◊◊; <
)
◊◊< =
;
◊◊= >
builderÿÿ 
.
ÿÿ 
Services
ÿÿ 
.
ÿÿ 
	AddScoped
ÿÿ 
<
ÿÿ 
IAdminRepository
ÿÿ +
,
ÿÿ+ ,
AdminRepository
ÿÿ- <
>
ÿÿ< =
(
ÿÿ= >
)
ÿÿ> ?
;
ÿÿ? @
builderŸŸ 
.
ŸŸ 
Services
ŸŸ 
.
ŸŸ 
	AddScoped
ŸŸ 
<
ŸŸ 
IPasswordHasher
ŸŸ *
<
ŸŸ* +
User
ŸŸ+ /
>
ŸŸ/ 0
,
ŸŸ0 1
PasswordHasher
ŸŸ2 @
<
ŸŸ@ A
User
ŸŸA E
>
ŸŸE F
>
ŸŸF G
(
ŸŸG H
)
ŸŸH I
;
ŸŸI J
builderﬂﬂ 
.
ﬂﬂ 
Services
ﬂﬂ 
.
ﬂﬂ 
	AddScoped
ﬂﬂ 
<
ﬂﬂ 
IPatientService
ﬂﬂ *
,
ﬂﬂ* +
PatientService
ﬂﬂ, :
>
ﬂﬂ: ;
(
ﬂﬂ; <
)
ﬂﬂ< =
;
ﬂﬂ= >
builder‡‡ 
.
‡‡ 
Services
‡‡ 
.
‡‡ 
	AddScoped
‡‡ 
<
‡‡ 
IDoctorService
‡‡ )
,
‡‡) *
DoctorService
‡‡+ 8
>
‡‡8 9
(
‡‡9 :
)
‡‡: ;
;
‡‡; <
builder·· 
.
·· 
Services
·· 
.
·· 
	AddScoped
·· 
<
·· !
IAppointmentService
·· .
,
··. / 
AppointmentService
··0 B
>
··B C
(
··C D
)
··D E
;
··E F
builder‚‚ 
.
‚‚ 
Services
‚‚ 
.
‚‚ 
	AddScoped
‚‚ 
<
‚‚ "
IHealthRecordService
‚‚ /
,
‚‚/ 0!
HealthRecordService
‚‚1 D
>
‚‚D E
(
‚‚E F
)
‚‚F G
;
‚‚G H
builder„„ 
.
„„ 
Services
„„ 
.
„„ 
	AddScoped
„„ 
<
„„ 
IAuthService
„„ '
,
„„' (
AuthService
„„) 4
>
„„4 5
(
„„5 6
)
„„6 7
;
„„7 8
builder‰‰ 
.
‰‰ 
Services
‰‰ 
.
‰‰ 
	AddScoped
‰‰ 
<
‰‰ 
IAdminService
‰‰ (
,
‰‰( )
AdminService
‰‰* 6
>
‰‰6 7
(
‰‰7 8
)
‰‰8 9
;
‰‰9 :
builderÂÂ 
.
ÂÂ 
Services
ÂÂ 
.
ÂÂ 
	AddScoped
ÂÂ 
<
ÂÂ 
IUserService
ÂÂ '
,
ÂÂ' (
UserService
ÂÂ) 4
>
ÂÂ4 5
(
ÂÂ5 6
)
ÂÂ6 7
;
ÂÂ7 8
builderÎÎ 
.
ÎÎ 
Services
ÎÎ 
.
ÎÎ 
AddHostedService
ÎÎ !
<
ÎÎ! "
HeartbeatService
ÎÎ" 2
>
ÎÎ2 3
(
ÎÎ3 4
)
ÎÎ4 5
;
ÎÎ5 6
builderÏÏ 
.
ÏÏ 
Services
ÏÏ 
.
ÏÏ 
AddHostedService
ÏÏ !
<
ÏÏ! "(
NotificationCleanupService
ÏÏ" <
>
ÏÏ< =
(
ÏÏ= >
)
ÏÏ> ?
;
ÏÏ? @
builderÌÌ 
.
ÌÌ 
Services
ÌÌ 
.
ÌÌ 
AddHostedService
ÌÌ !
<
ÌÌ! "+
AppointmentMaintenanceService
ÌÌ" ?
>
ÌÌ? @
(
ÌÌ@ A
)
ÌÌA B
;
ÌÌB C
builderÛÛ 
.
ÛÛ 
Services
ÛÛ 
.
ÛÛ 
AddMassTransit
ÛÛ 
(
ÛÛ  
options
ÛÛ  '
=>
ÛÛ( *
{ÙÙ 
options
ıı 
.
ıı 
AddConsumer
ıı 
<
ıı '
AppointmentBookedConsumer
ıı 1
>
ıı1 2
(
ıı2 3
)
ıı3 4
;
ıı4 5
options
˜˜ 
.
˜˜ 
UsingRabbitMq
˜˜ 
(
˜˜ 
(
˜˜ 
context
˜˜ "
,
˜˜" #
cfg
˜˜$ '
)
˜˜' (
=>
˜˜) +
{
¯¯ 
cfg
˘˘ 
.
˘˘ 
Host
˘˘ 
(
˘˘ 
$str
˘˘ 
,
˘˘ 
$str
˘˘ !
,
˘˘! "
host
˘˘# '
=>
˘˘( *
{
˙˙ 	
host
˚˚ 
.
˚˚ 
Username
˚˚ 
(
˚˚ 
$str
˚˚ !
)
˚˚! "
;
˚˚" #
host
¸¸ 
.
¸¸ 
Password
¸¸ 
(
¸¸ 
$str
¸¸ !
)
¸¸! "
;
¸¸" #
}
˝˝ 	
)
˝˝	 

;
˝˝
 
cfg
ˇˇ 
.
ˇˇ 
ReceiveEndpoint
ˇˇ 
(
ˇˇ 
$str
ÄÄ &
,
ÄÄ& '
endpoint
ÅÅ 
=>
ÅÅ 
{
ÇÇ 
endpoint
ÉÉ 
.
ÉÉ 
ConfigureConsumer
ÉÉ *
<
ÉÉ* +'
AppointmentBookedConsumer
ÉÉ+ D
>
ÉÉD E
(
ÉÉE F
context
ÑÑ 
)
ÑÑ 
;
ÑÑ 
}
ÖÖ 
)
ÖÖ 
;
ÖÖ 
}
ÜÜ 
)
ÜÜ 
;
ÜÜ 
}áá 
)
áá 
;
áá 
varãã 
app
ãã 
=
ãã 	
builder
ãã
 
.
ãã 
Build
ãã 
(
ãã 
)
ãã 
;
ãã 
ifèè 
(
èè 
app
èè 
.
èè 
Environment
èè 
.
èè 
IsDevelopment
èè !
(
èè! "
)
èè" #
)
èè# $
{êê 
app
ëë 
.
ëë 

UseSwagger
ëë 
(
ëë 
)
ëë 
;
ëë 
app
ìì 
.
ìì 
UseSwaggerUI
ìì 
(
ìì 
options
ìì 
=>
ìì 
{
îî 
options
ïï 
.
ïï 
SwaggerEndpoint
ïï 
(
ïï  
$str
ññ &
,
ññ& '
$str
óó 
)
óó  
;
óó  !
options
ôô 
.
ôô 
RoutePrefix
ôô 
=
ôô 
string
ôô $
.
ôô$ %
Empty
ôô% *
;
ôô* +
}
öö 
)
öö 
;
öö 
}õõ 
appùù 
.
ùù &
UseSerilogRequestLogging
ùù 
(
ùù 
)
ùù 
;
ùù 
appüü 
.
üü 
UseMiddleware
üü 
<
üü !
ExceptionMiddleware
üü %
>
üü% &
(
üü& '
)
üü' (
;
üü( )
app°° 
.
°° !
UseHttpsRedirection
°° 
(
°° 
)
°° 
;
°° 
app££ 
.
££ 
UseCors
££ 
(
££ 
$str
££ 
)
££ 
;
££ 
app•• 
.
•• 
UseAuthentication
•• 
(
•• 
)
•• 
;
•• 
appßß 
.
ßß 
UseAuthorization
ßß 
(
ßß 
)
ßß 
;
ßß 
app©© 
.
©© 
MapControllers
©© 
(
©© 
)
©© 
;
©© 
await≠≠ 
app
≠≠ 	
.
≠≠	 

RunAsync
≠≠
 
(
≠≠ 
)
≠≠ 
;
≠≠ Ú
MC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Models\User.cs
	namespace 	
S4_HealthAxisApi
 
. 
Models !
{ 
public 

class 
User 
{ 
[ 	
Key	 
] 
public		 
int		 
UserId		 
{		 
get		 
;		  
set		! $
;		$ %
}		& '
[ 	
Required	 
] 
[ 	
EmailAddress	 
] 
[ 	
	MaxLength	 
( 
$num 
) 
] 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
[ 	
Required	 
] 
public 
string 
PasswordHash "
{# $
get% (
;( )
set* -
;- .
}/ 0
=1 2
string3 9
.9 :
Empty: ?
;? @
[ 	
Required	 
] 
public 
UserRole 
Role 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
? 
ReferenceId 
{  !
get" %
;% &
set' *
;* +
}, -
public 
DateTime 
CreatedDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
=2 3
DateTime4 <
.< =
UtcNow= C
;C D
public 
string 
? 
RefreshToken #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
bool 
MustChangePassword &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
=5 6
false7 <
;< =
public 
DateTime 
? "
RefreshTokenExpiryTime /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
} 
} ˘!
PC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Models\Patient.cs
	namespace 	
S4_HealthAxisApi
 
. 
Models !
{ 
public 

class 
Patient 
{ 
[ 	
Key	 
] 
public 
int 
	PatientId 
{ 
get "
;" #
set$ '
;' (
}) *
[

 	
Required

	 
(

 
ErrorMessage

 
=

  
$str

! <
)

< =
]

= >
[ 	
StringLength	 
( 
$num 
, 
ErrorMessage &
=' (
$str) T
)T U
]U V
public 
string 
FullName 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
[ 	
Required	 
( 
ErrorMessage 
=  
$str! =
)= >
]> ?
public 
DateOnly 
DateOfBirth #
{$ %
get& )
;) *
set+ .
;. /
}0 1
[ 	
Required	 
( 
ErrorMessage 
=  
$str! 6
)6 7
]7 8
public 
Gender 
Gender 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
Required	 
( 
ErrorMessage 
=  
$str! <
)< =
]= >
[ 	
Phone	 
( 
ErrorMessage 
= 
$str <
)< =
]= >
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
PhoneNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
string2 8
.8 9
Empty9 >
;> ?
[ 	
Required	 
( 
ErrorMessage 
=  
$str! 5
)5 6
]6 7
[ 	
EmailAddress	 
( 
ErrorMessage "
=# $
$str% =
)= >
]> ?
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
[ 	
Required	 
] 
public 
InsuranceStatus 
InsuranceStatus .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
[!! 	
StringLength!!	 
(!! 
$num!! 
)!! 
]!! 
public"" 
string"" 
?"" 
InsuranceNumber"" &
{""' (
get"") ,
;"", -
set"". 1
;""1 2
}""3 4
public$$ 
bool$$ 
IsActive$$ 
{$$ 
get$$ "
;$$" #
set$$$ '
;$$' (
}$$) *
=$$+ ,
true$$- 1
;$$1 2
public'' 
ICollection'' 
<'' 
Appointment'' &
>''& '
Appointments''( 4
{''5 6
get''7 :
;'': ;
set''< ?
;''? @
}''A B
=''C D
new''E H
List''I M
<''M N
Appointment''N Y
>''Y Z
(''Z [
)''[ \
;''\ ]
public)) 
ICollection)) 
<)) 
HealthRecord)) '
>))' (
HealthRecords))) 6
{))7 8
get))9 <
;))< =
set))> A
;))A B
}))C D
=))E F
new))G J
List))K O
<))O P
HealthRecord))P \
>))\ ]
())] ^
)))^ _
;))_ `
}** 
}++ –
UC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Models\Notification.cs
	namespace 	
S4_HealthAxisApi
 
. 
Models !
{ 
public 

class 
Notification 
{ 
[ 	
Key	 
] 
public 
int 
NotificationId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public

 
int

 
DoctorId

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
int 
? 
AppointmentId !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	
Required	 
] 
[ 	
	MaxLength	 
( 
$num 
) 
] 
public 
string 
Message 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
string. 4
.4 5
Empty5 :
;: ;
public 
bool 
IsRead 
{ 
get  
;  !
set" %
;% &
}' (
public 
DateTime 
	CreatedOn !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
DateTime2 :
.: ;
UtcNow; A
;A B
} 
} Õ
UC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Models\HealthRecord.cs
	namespace 	
S4_HealthAxisApi
 
. 
Models !
{ 
public 

class 
HealthRecord 
{ 
[ 	
Key	 
] 
public 
int 
HealthRecordId !
{" #
get$ '
;' (
set) ,
;, -
}. /
[

 	
Required

	 
]

 
public 
int 
AppointmentId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
Appointment 
Appointment &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
=5 6
null7 ;
!; <
;< =
[ 	
Required	 
] 
public 
int 
	PatientId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
Patient 
Patient 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
null/ 3
!3 4
;4 5
[ 	
Required	 
] 
public 
int 
DoctorId 
{ 
get !
;! "
set# &
;& '
}( )
public 
Doctor 
Doctor 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
null- 1
!1 2
;2 3
[ 	
Required	 
( 
ErrorMessage 
=  
$str! 9
)9 :
]: ;
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
	Diagnosis 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
string0 6
.6 7
Empty7 <
;< =
[ 	
Required	 
( 
ErrorMessage 
=  
$str! <
)< =
]= >
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
Prescription "
{# $
get% (
;( )
set* -
;- .
}/ 0
=1 2
string3 9
.9 :
Empty: ?
;? @
[!! 	
StringLength!!	 
(!! 
$num!! 
)!! 
]!! 
public"" 
string"" 
?"" 
Notes"" 
{"" 
get"" "
;""" #
set""$ '
;""' (
}"") *
public$$ 
DateTime$$ 
	CreatedOn$$ !
{$$" #
get$$$ '
;$$' (
set$$) ,
;$$, -
}$$. /
=$$0 1
DateTime$$2 :
.$$: ;
UtcNow$$; A
;$$A B
}%% 
}&& í
OC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Models\Doctor.cs
	namespace 	
S4_HealthAxisApi
 
. 
Models !
{ 
[ 
Index 

(
 
nameof 
( 
Email 
) 
, 
IsUnique "
=# $
true% )
)) *
]* +
public		 

class		 
Doctor		 
{

 
[ 	
Key	 
] 
public 
int 
DoctorId 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
( 
ErrorMessage 
=  
$str! ;
); <
]< =
[ 	
StringLength	 
( 
$num 
, 
ErrorMessage '
=( )
$str* U
)U V
]V W
public 
string 
FullName 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
[ 	
Required	 
] 
[ 	
EmailAddress	 
] 
[ 	
StringLength	 
( 
$num 
) 
] 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
[ 	
Required	 
( 
ErrorMessage 
=  
$str! >
)> ?
]? @
public  
DoctorSpecialisation #
Specialisation$ 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
[ 	
Required	 
( 
ErrorMessage 
=  
$str! C
)C D
]D E
[ 	
Range	 
( 
$num 
, 
$num 
, 
ErrorMessage "
=# $
$str% Q
)Q R
]R S
public 
int 
YearsOfExperience $
{% &
get' *
;* +
set, /
;/ 0
}1 2
[ 	
Required	 
( 
ErrorMessage 
=  
$str! @
)@ A
]A B
[ 	
Range	 
( 
$num 
, 
$num 
, 
ErrorMessage )
=* +
$str, Y
)Y Z
]Z [
public   
decimal   
ConsultationFee   &
{  ' (
get  ) ,
;  , -
set  . 1
;  1 2
}  3 4
public"" 
bool"" 
IsActive"" 
{"" 
get"" "
;""" #
set""$ '
;""' (
}"") *
=""+ ,
true""- 1
;""1 2
public%% 
ICollection%% 
<%% 
Appointment%% &
>%%& '
Appointments%%( 4
{%%5 6
get%%7 :
;%%: ;
set%%< ?
;%%? @
}%%A B
=&& 
new&& 
List&& 
<&& 
Appointment&& "
>&&" #
(&&# $
)&&$ %
;&&% &
public(( 
ICollection(( 
<(( 
HealthRecord(( '
>((' (
HealthRecords(() 6
{((7 8
get((9 <
;((< =
set((> A
;((A B
}((C D
=)) 
new)) 
List)) 
<)) 
HealthRecord)) #
>))# $
())$ %
)))% &
;))& '
}** 
}++ Ã
TC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Models\Appointment.cs
	namespace 	
S4_HealthAxisApi
 
. 
Models !
{ 
public 

class 
Appointment 
{ 
[		 	
Key			 
]		 
public

 
int

 
AppointmentId

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
[ 	
Required	 
] 
public 
int 
	PatientId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
Patient 
Patient 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
null/ 3
!3 4
;4 5
[ 	
Required	 
] 
public 
int 
DoctorId 
{ 
get !
;! "
set# &
;& '
}( )
public 
Doctor 
Doctor 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
null- 1
!1 2
;2 3
[ 	
Required	 
] 
public 
DateOnly 
ScheduledDate %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
[ 	
Required	 
] 
public 
AppointmentTimeSlot "
TimeSlot# +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
AppointmentStatus  
Status! '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
= 
AppointmentStatus 
.  
Pending  '
;' (
[ 	
StringLength	 
( 
$num 
) 
] 
public   
string   
?   
CancellationReason   )
{  * +
get  , /
;  / 0
set  1 4
;  4 5
}  6 7
public"" 
HealthRecord"" 
?"" 
HealthRecord"" )
{""* +
get"", /
;""/ 0
set""1 4
;""4 5
}""6 7
}## 
}$$ ä˝
iC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Migrations\20260711103901_InitialCreate.cs
	namespace 	
S4_HealthAxisApi
 
. 

Migrations %
{		 
public 

partial 
class 
InitialCreate &
:' (
	Migration) 2
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str 
,  
columns 
: 
table 
=> !
new" %
{ 
DoctorId 
= 
table $
.$ %
Column% +
<+ ,
int, /
>/ 0
(0 1
type1 5
:5 6
$str7 <
,< =
nullable> F
:F G
falseH M
)M N
. 

Annotation #
(# $
$str$ 8
,8 9
$str: @
)@ A
,A B
FullName 
= 
table $
.$ %
Column% +
<+ ,
string, 2
>2 3
(3 4
type4 8
:8 9
$str: I
,I J
	maxLengthK T
:T U
$numV Y
,Y Z
nullable[ c
:c d
falsee j
)j k
,k l
Email 
= 
table !
.! "
Column" (
<( )
string) /
>/ 0
(0 1
type1 5
:5 6
$str7 F
,F G
	maxLengthH Q
:Q R
$numS V
,V W
nullableX `
:` a
falseb g
)g h
,h i
Specialisation "
=# $
table% *
.* +
Column+ 1
<1 2
int2 5
>5 6
(6 7
type7 ;
:; <
$str= B
,B C
nullableD L
:L M
falseN S
)S T
,T U
YearsOfExperience %
=& '
table( -
.- .
Column. 4
<4 5
int5 8
>8 9
(9 :
type: >
:> ?
$str@ E
,E F
nullableG O
:O P
falseQ V
)V W
,W X
ConsultationFee #
=$ %
table& +
.+ ,
Column, 2
<2 3
decimal3 :
>: ;
(; <
type< @
:@ A
$strB Q
,Q R
	precisionS \
:\ ]
$num^ `
,` a
scaleb g
:g h
$numi j
,j k
nullablel t
:t u
falsev {
){ |
,| }
IsActive 
= 
table $
.$ %
Column% +
<+ ,
bool, 0
>0 1
(1 2
type2 6
:6 7
$str8 =
,= >
nullable? G
:G H
falseI N
)N O
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 1
,1 2
x3 4
=>5 7
x8 9
.9 :
DoctorId: B
)B C
;C D
}   
)   
;   
migrationBuilder"" 
."" 
CreateTable"" (
(""( )
name## 
:## 
$str## %
,##% &
columns$$ 
:$$ 
table$$ 
=>$$ !
new$$" %
{%% 
NotificationId&& "
=&&# $
table&&% *
.&&* +
Column&&+ 1
<&&1 2
int&&2 5
>&&5 6
(&&6 7
type&&7 ;
:&&; <
$str&&= B
,&&B C
nullable&&D L
:&&L M
false&&N S
)&&S T
.'' 

Annotation'' #
(''# $
$str''$ 8
,''8 9
$str'': @
)''@ A
,''A B
DoctorId(( 
=(( 
table(( $
.(($ %
Column((% +
<((+ ,
int((, /
>((/ 0
(((0 1
type((1 5
:((5 6
$str((7 <
,((< =
nullable((> F
:((F G
false((H M
)((M N
,((N O
AppointmentId)) !
=))" #
table))$ )
.))) *
Column))* 0
<))0 1
int))1 4
>))4 5
())5 6
type))6 :
:)): ;
$str))< A
,))A B
nullable))C K
:))K L
true))M Q
)))Q R
,))R S
Message** 
=** 
table** #
.**# $
Column**$ *
<*** +
string**+ 1
>**1 2
(**2 3
type**3 7
:**7 8
$str**9 H
,**H I
	maxLength**J S
:**S T
$num**U X
,**X Y
nullable**Z b
:**b c
false**d i
)**i j
,**j k
IsRead++ 
=++ 
table++ "
.++" #
Column++# )
<++) *
bool++* .
>++. /
(++/ 0
type++0 4
:++4 5
$str++6 ;
,++; <
nullable++= E
:++E F
false++G L
)++L M
,++M N
	CreatedOn,, 
=,, 
table,,  %
.,,% &
Column,,& ,
<,,, -
DateTime,,- 5
>,,5 6
(,,6 7
type,,7 ;
:,,; <
$str,,= H
,,,H I
nullable,,J R
:,,R S
false,,T Y
),,Y Z
}-- 
,-- 
constraints.. 
:.. 
table.. "
=>..# %
{// 
table00 
.00 

PrimaryKey00 $
(00$ %
$str00% 7
,007 8
x009 :
=>00; =
x00> ?
.00? @
NotificationId00@ N
)00N O
;00O P
}11 
)11 
;11 
migrationBuilder33 
.33 
CreateTable33 (
(33( )
name44 
:44 
$str44  
,44  !
columns55 
:55 
table55 
=>55 !
new55" %
{66 
	PatientId77 
=77 
table77  %
.77% &
Column77& ,
<77, -
int77- 0
>770 1
(771 2
type772 6
:776 7
$str778 =
,77= >
nullable77? G
:77G H
false77I N
)77N O
.88 

Annotation88 #
(88# $
$str88$ 8
,888 9
$str88: @
)88@ A
,88A B
FullName99 
=99 
table99 $
.99$ %
Column99% +
<99+ ,
string99, 2
>992 3
(993 4
type994 8
:998 9
$str99: H
,99H I
	maxLength99J S
:99S T
$num99U W
,99W X
nullable99Y a
:99a b
false99c h
)99h i
,99i j
DateOfBirth:: 
=::  !
table::" '
.::' (
Column::( .
<::. /
DateOnly::/ 7
>::7 8
(::8 9
type::9 =
:::= >
$str::? E
,::E F
nullable::G O
:::O P
false::Q V
)::V W
,::W X
Gender;; 
=;; 
table;; "
.;;" #
Column;;# )
<;;) *
int;;* -
>;;- .
(;;. /
type;;/ 3
:;;3 4
$str;;5 :
,;;: ;
nullable;;< D
:;;D E
false;;F K
);;K L
,;;L M
PhoneNumber<< 
=<<  !
table<<" '
.<<' (
Column<<( .
<<<. /
string<</ 5
><<5 6
(<<6 7
type<<7 ;
:<<; <
$str<<= K
,<<K L
	maxLength<<M V
:<<V W
$num<<X Z
,<<Z [
nullable<<\ d
:<<d e
false<<f k
)<<k l
,<<l m
Email== 
=== 
table== !
.==! "
Column==" (
<==( )
string==) /
>==/ 0
(==0 1
type==1 5
:==5 6
$str==7 F
,==F G
	maxLength==H Q
:==Q R
$num==S V
,==V W
nullable==X `
:==` a
false==b g
)==g h
,==h i
InsuranceStatus>> #
=>>$ %
table>>& +
.>>+ ,
Column>>, 2
<>>2 3
int>>3 6
>>>6 7
(>>7 8
type>>8 <
:>>< =
$str>>> C
,>>C D
nullable>>E M
:>>M N
false>>O T
)>>T U
,>>U V
InsuranceNumber?? #
=??$ %
table??& +
.??+ ,
Column??, 2
<??2 3
string??3 9
>??9 :
(??: ;
type??; ?
:??? @
$str??A O
,??O P
	maxLength??Q Z
:??Z [
$num??\ ^
,??^ _
nullable??` h
:??h i
true??j n
)??n o
,??o p
IsActive@@ 
=@@ 
table@@ $
.@@$ %
Column@@% +
<@@+ ,
bool@@, 0
>@@0 1
(@@1 2
type@@2 6
:@@6 7
$str@@8 =
,@@= >
nullable@@? G
:@@G H
false@@I N
)@@N O
}AA 
,AA 
constraintsBB 
:BB 
tableBB "
=>BB# %
{CC 
tableDD 
.DD 

PrimaryKeyDD $
(DD$ %
$strDD% 2
,DD2 3
xDD4 5
=>DD6 8
xDD9 :
.DD: ;
	PatientIdDD; D
)DDD E
;DDE F
}EE 
)EE 
;EE 
migrationBuilderGG 
.GG 
CreateTableGG (
(GG( )
nameHH 
:HH 
$strHH 
,HH 
columnsII 
:II 
tableII 
=>II !
newII" %
{JJ 
UserIdKK 
=KK 
tableKK "
.KK" #
ColumnKK# )
<KK) *
intKK* -
>KK- .
(KK. /
typeKK/ 3
:KK3 4
$strKK5 :
,KK: ;
nullableKK< D
:KKD E
falseKKF K
)KKK L
.LL 

AnnotationLL #
(LL# $
$strLL$ 8
,LL8 9
$strLL: @
)LL@ A
,LLA B
EmailMM 
=MM 
tableMM !
.MM! "
ColumnMM" (
<MM( )
stringMM) /
>MM/ 0
(MM0 1
typeMM1 5
:MM5 6
$strMM7 F
,MMF G
	maxLengthMMH Q
:MMQ R
$numMMS V
,MMV W
nullableMMX `
:MM` a
falseMMb g
)MMg h
,MMh i
PasswordHashNN  
=NN! "
tableNN# (
.NN( )
ColumnNN) /
<NN/ 0
stringNN0 6
>NN6 7
(NN7 8
typeNN8 <
:NN< =
$strNN> M
,NNM N
nullableNNO W
:NNW X
falseNNY ^
)NN^ _
,NN_ `
RoleOO 
=OO 
tableOO  
.OO  !
ColumnOO! '
<OO' (
intOO( +
>OO+ ,
(OO, -
typeOO- 1
:OO1 2
$strOO3 8
,OO8 9
nullableOO: B
:OOB C
falseOOD I
)OOI J
,OOJ K
ReferenceIdPP 
=PP  !
tablePP" '
.PP' (
ColumnPP( .
<PP. /
intPP/ 2
>PP2 3
(PP3 4
typePP4 8
:PP8 9
$strPP: ?
,PP? @
nullablePPA I
:PPI J
truePPK O
)PPO P
,PPP Q
CreatedDateQQ 
=QQ  !
tableQQ" '
.QQ' (
ColumnQQ( .
<QQ. /
DateTimeQQ/ 7
>QQ7 8
(QQ8 9
typeQQ9 =
:QQ= >
$strQQ? J
,QQJ K
nullableQQL T
:QQT U
falseQQV [
)QQ[ \
,QQ\ ]
RefreshTokenRR  
=RR! "
tableRR# (
.RR( )
ColumnRR) /
<RR/ 0
stringRR0 6
>RR6 7
(RR7 8
typeRR8 <
:RR< =
$strRR> M
,RRM N
nullableRRO W
:RRW X
trueRRY ]
)RR] ^
,RR^ _
MustChangePasswordSS &
=SS' (
tableSS) .
.SS. /
ColumnSS/ 5
<SS5 6
boolSS6 :
>SS: ;
(SS; <
typeSS< @
:SS@ A
$strSSB G
,SSG H
nullableSSI Q
:SSQ R
falseSSS X
)SSX Y
,SSY Z"
RefreshTokenExpiryTimeTT *
=TT+ ,
tableTT- 2
.TT2 3
ColumnTT3 9
<TT9 :
DateTimeTT: B
>TTB C
(TTC D
typeTTD H
:TTH I
$strTTJ U
,TTU V
nullableTTW _
:TT_ `
trueTTa e
)TTe f
}UU 
,UU 
constraintsVV 
:VV 
tableVV "
=>VV# %
{WW 
tableXX 
.XX 

PrimaryKeyXX $
(XX$ %
$strXX% /
,XX/ 0
xXX1 2
=>XX3 5
xXX6 7
.XX7 8
UserIdXX8 >
)XX> ?
;XX? @
}YY 
)YY 
;YY 
migrationBuilder[[ 
.[[ 
CreateTable[[ (
([[( )
name\\ 
:\\ 
$str\\ $
,\\$ %
columns]] 
:]] 
table]] 
=>]] !
new]]" %
{^^ 
AppointmentId__ !
=__" #
table__$ )
.__) *
Column__* 0
<__0 1
int__1 4
>__4 5
(__5 6
type__6 :
:__: ;
$str__< A
,__A B
nullable__C K
:__K L
false__M R
)__R S
.`` 

Annotation`` #
(``# $
$str``$ 8
,``8 9
$str``: @
)``@ A
,``A B
	PatientIdaa 
=aa 
tableaa  %
.aa% &
Columnaa& ,
<aa, -
intaa- 0
>aa0 1
(aa1 2
typeaa2 6
:aa6 7
$straa8 =
,aa= >
nullableaa? G
:aaG H
falseaaI N
)aaN O
,aaO P
DoctorIdbb 
=bb 
tablebb $
.bb$ %
Columnbb% +
<bb+ ,
intbb, /
>bb/ 0
(bb0 1
typebb1 5
:bb5 6
$strbb7 <
,bb< =
nullablebb> F
:bbF G
falsebbH M
)bbM N
,bbN O
ScheduledDatecc !
=cc" #
tablecc$ )
.cc) *
Columncc* 0
<cc0 1
DateOnlycc1 9
>cc9 :
(cc: ;
typecc; ?
:cc? @
$strccA G
,ccG H
nullableccI Q
:ccQ R
falseccS X
)ccX Y
,ccY Z
TimeSlotdd 
=dd 
tabledd $
.dd$ %
Columndd% +
<dd+ ,
intdd, /
>dd/ 0
(dd0 1
typedd1 5
:dd5 6
$strdd7 <
,dd< =
nullabledd> F
:ddF G
falseddH M
)ddM N
,ddN O
Statusee 
=ee 
tableee "
.ee" #
Columnee# )
<ee) *
intee* -
>ee- .
(ee. /
typeee/ 3
:ee3 4
$stree5 :
,ee: ;
nullableee< D
:eeD E
falseeeF K
)eeK L
,eeL M
CancellationReasonff &
=ff' (
tableff) .
.ff. /
Columnff/ 5
<ff5 6
stringff6 <
>ff< =
(ff= >
typeff> B
:ffB C
$strffD S
,ffS T
	maxLengthffU ^
:ff^ _
$numff` c
,ffc d
nullableffe m
:ffm n
trueffo s
)ffs t
}gg 
,gg 
constraintshh 
:hh 
tablehh "
=>hh# %
{ii 
tablejj 
.jj 

PrimaryKeyjj $
(jj$ %
$strjj% 6
,jj6 7
xjj8 9
=>jj: <
xjj= >
.jj> ?
AppointmentIdjj? L
)jjL M
;jjM N
tablekk 
.kk 

ForeignKeykk $
(kk$ %
namell 
:ll 
$strll @
,ll@ A
columnmm 
:mm 
xmm  !
=>mm" $
xmm% &
.mm& '
DoctorIdmm' /
,mm/ 0
principalTablenn &
:nn& '
$strnn( 1
,nn1 2
principalColumnoo '
:oo' (
$stroo) 3
,oo3 4
onDeletepp  
:pp  !
ReferentialActionpp" 3
.pp3 4
Restrictpp4 <
)pp< =
;pp= >
tableqq 
.qq 

ForeignKeyqq $
(qq$ %
namerr 
:rr 
$strrr B
,rrB C
columnss 
:ss 
xss  !
=>ss" $
xss% &
.ss& '
	PatientIdss' 0
,ss0 1
principalTablett &
:tt& '
$strtt( 2
,tt2 3
principalColumnuu '
:uu' (
$struu) 4
,uu4 5
onDeletevv  
:vv  !
ReferentialActionvv" 3
.vv3 4
Restrictvv4 <
)vv< =
;vv= >
}ww 
)ww 
;ww 
migrationBuilderyy 
.yy 
CreateTableyy (
(yy( )
namezz 
:zz 
$strzz %
,zz% &
columns{{ 
:{{ 
table{{ 
=>{{ !
new{{" %
{|| 
HealthRecordId}} "
=}}# $
table}}% *
.}}* +
Column}}+ 1
<}}1 2
int}}2 5
>}}5 6
(}}6 7
type}}7 ;
:}}; <
$str}}= B
,}}B C
nullable}}D L
:}}L M
false}}N S
)}}S T
.~~ 

Annotation~~ #
(~~# $
$str~~$ 8
,~~8 9
$str~~: @
)~~@ A
,~~A B
AppointmentId !
=" #
table$ )
.) *
Column* 0
<0 1
int1 4
>4 5
(5 6
type6 :
:: ;
$str< A
,A B
nullableC K
:K L
falseM R
)R S
,S T
	PatientId
ÄÄ 
=
ÄÄ 
table
ÄÄ  %
.
ÄÄ% &
Column
ÄÄ& ,
<
ÄÄ, -
int
ÄÄ- 0
>
ÄÄ0 1
(
ÄÄ1 2
type
ÄÄ2 6
:
ÄÄ6 7
$str
ÄÄ8 =
,
ÄÄ= >
nullable
ÄÄ? G
:
ÄÄG H
false
ÄÄI N
)
ÄÄN O
,
ÄÄO P
DoctorId
ÅÅ 
=
ÅÅ 
table
ÅÅ $
.
ÅÅ$ %
Column
ÅÅ% +
<
ÅÅ+ ,
int
ÅÅ, /
>
ÅÅ/ 0
(
ÅÅ0 1
type
ÅÅ1 5
:
ÅÅ5 6
$str
ÅÅ7 <
,
ÅÅ< =
nullable
ÅÅ> F
:
ÅÅF G
false
ÅÅH M
)
ÅÅM N
,
ÅÅN O
	Diagnosis
ÇÇ 
=
ÇÇ 
table
ÇÇ  %
.
ÇÇ% &
Column
ÇÇ& ,
<
ÇÇ, -
string
ÇÇ- 3
>
ÇÇ3 4
(
ÇÇ4 5
type
ÇÇ5 9
:
ÇÇ9 :
$str
ÇÇ; K
,
ÇÇK L
	maxLength
ÇÇM V
:
ÇÇV W
$num
ÇÇX \
,
ÇÇ\ ]
nullable
ÇÇ^ f
:
ÇÇf g
false
ÇÇh m
)
ÇÇm n
,
ÇÇn o
Prescription
ÉÉ  
=
ÉÉ! "
table
ÉÉ# (
.
ÉÉ( )
Column
ÉÉ) /
<
ÉÉ/ 0
string
ÉÉ0 6
>
ÉÉ6 7
(
ÉÉ7 8
type
ÉÉ8 <
:
ÉÉ< =
$str
ÉÉ> N
,
ÉÉN O
	maxLength
ÉÉP Y
:
ÉÉY Z
$num
ÉÉ[ _
,
ÉÉ_ `
nullable
ÉÉa i
:
ÉÉi j
false
ÉÉk p
)
ÉÉp q
,
ÉÉq r
Notes
ÑÑ 
=
ÑÑ 
table
ÑÑ !
.
ÑÑ! "
Column
ÑÑ" (
<
ÑÑ( )
string
ÑÑ) /
>
ÑÑ/ 0
(
ÑÑ0 1
type
ÑÑ1 5
:
ÑÑ5 6
$str
ÑÑ7 G
,
ÑÑG H
	maxLength
ÑÑI R
:
ÑÑR S
$num
ÑÑT X
,
ÑÑX Y
nullable
ÑÑZ b
:
ÑÑb c
true
ÑÑd h
)
ÑÑh i
,
ÑÑi j
	CreatedOn
ÖÖ 
=
ÖÖ 
table
ÖÖ  %
.
ÖÖ% &
Column
ÖÖ& ,
<
ÖÖ, -
DateTime
ÖÖ- 5
>
ÖÖ5 6
(
ÖÖ6 7
type
ÖÖ7 ;
:
ÖÖ; <
$str
ÖÖ= H
,
ÖÖH I
nullable
ÖÖJ R
:
ÖÖR S
false
ÖÖT Y
)
ÖÖY Z
}
ÜÜ 
,
ÜÜ 
constraints
áá 
:
áá 
table
áá "
=>
áá# %
{
àà 
table
ââ 
.
ââ 

PrimaryKey
ââ $
(
ââ$ %
$str
ââ% 7
,
ââ7 8
x
ââ9 :
=>
ââ; =
x
ââ> ?
.
ââ? @
HealthRecordId
ââ@ N
)
ââN O
;
ââO P
table
ää 
.
ää 

ForeignKey
ää $
(
ää$ %
name
ãã 
:
ãã 
$str
ãã K
,
ããK L
column
åå 
:
åå 
x
åå  !
=>
åå" $
x
åå% &
.
åå& '
AppointmentId
åå' 4
,
åå4 5
principalTable
çç &
:
çç& '
$str
çç( 6
,
çç6 7
principalColumn
éé '
:
éé' (
$str
éé) 8
,
éé8 9
onDelete
èè  
:
èè  !
ReferentialAction
èè" 3
.
èè3 4
Restrict
èè4 <
)
èè< =
;
èè= >
table
êê 
.
êê 

ForeignKey
êê $
(
êê$ %
name
ëë 
:
ëë 
$str
ëë A
,
ëëA B
column
íí 
:
íí 
x
íí  !
=>
íí" $
x
íí% &
.
íí& '
DoctorId
íí' /
,
íí/ 0
principalTable
ìì &
:
ìì& '
$str
ìì( 1
,
ìì1 2
principalColumn
îî '
:
îî' (
$str
îî) 3
,
îî3 4
onDelete
ïï  
:
ïï  !
ReferentialAction
ïï" 3
.
ïï3 4
Restrict
ïï4 <
)
ïï< =
;
ïï= >
table
ññ 
.
ññ 

ForeignKey
ññ $
(
ññ$ %
name
óó 
:
óó 
$str
óó C
,
óóC D
column
òò 
:
òò 
x
òò  !
=>
òò" $
x
òò% &
.
òò& '
	PatientId
òò' 0
,
òò0 1
principalTable
ôô &
:
ôô& '
$str
ôô( 2
,
ôô2 3
principalColumn
öö '
:
öö' (
$str
öö) 4
,
öö4 5
onDelete
õõ  
:
õõ  !
ReferentialAction
õõ" 3
.
õõ3 4
Restrict
õõ4 <
)
õõ< =
;
õõ= >
}
úú 
)
úú 
;
úú 
migrationBuilder
ûû 
.
ûû 

InsertData
ûû '
(
ûû' (
table
üü 
:
üü 
$str
üü  
,
üü  !
columns
†† 
:
†† 
new
†† 
[
†† 
]
†† 
{
††  
$str
††! +
,
††+ ,
$str
††- >
,
††> ?
$str
††@ G
,
††G H
$str
††I S
,
††S T
$str
††U _
,
††_ `
$str
††a q
,
††q r
$str††s Ü
}††á à
,††à â
values
°° 
:
°° 
new
°° 
object
°° "
[
°°" #
,
°°# $
]
°°$ %
{
¢¢ 
{
££ 
$num
££ 
,
££ 
$num
££  
,
££  !
$str
££" <
,
££< =
$str
££> I
,
££I J
true
££K O
,
££O P
$num
££Q R
,
££R S
$num
££T U
}
££V W
,
££W X
{
§§ 
$num
§§ 
,
§§ 
$num
§§ !
,
§§! "
$str
§§# ?
,
§§? @
$str
§§A N
,
§§N O
true
§§P T
,
§§T U
$num
§§V W
,
§§W X
$num
§§Y [
}
§§\ ]
}
•• 
)
•• 
;
•• 
migrationBuilder
ßß 
.
ßß 

InsertData
ßß '
(
ßß' (
table
®® 
:
®® 
$str
®® !
,
®®! "
columns
©© 
:
©© 
new
©© 
[
©© 
]
©© 
{
©©  
$str
©©! ,
,
©©, -
$str
©©. ;
,
©©; <
$str
©©= D
,
©©D E
$str
©©F P
,
©©P Q
$str
©©R Z
,
©©Z [
$str
©©\ m
,
©©m n
$str©©o Ä
,©©Ä Å
$str©©Ç å
,©©å ç
$str©©é õ
}©©ú ù
,©©ù û
values
™™ 
:
™™ 
new
™™ 
object
™™ "
[
™™" #
,
™™# $
]
™™$ %
{
´´ 
{
¨¨ 
$num
¨¨ 
,
¨¨ 
new
¨¨ 
DateOnly
¨¨ %
(
¨¨% &
$num
¨¨& *
,
¨¨* +
$num
¨¨, -
,
¨¨- .
$num
¨¨/ 1
)
¨¨1 2
,
¨¨2 3
$str
¨¨4 N
,
¨¨N O
$str
¨¨P ^
,
¨¨^ _
$num
¨¨` a
,
¨¨a b
$str
¨¨c l
,
¨¨l m
$num
¨¨n o
,
¨¨o p
true
¨¨q u
,
¨¨u v
$str¨¨w É
}¨¨Ñ Ö
,¨¨Ö Ü
{
≠≠ 
$num
≠≠ 
,
≠≠ 
new
≠≠ 
DateOnly
≠≠ %
(
≠≠% &
$num
≠≠& *
,
≠≠* +
$num
≠≠, .
,
≠≠. /
$num
≠≠0 1
)
≠≠1 2
,
≠≠2 3
$str
≠≠4 M
,
≠≠M N
$str
≠≠O \
,
≠≠\ ]
$num
≠≠^ _
,
≠≠_ `
$str
≠≠a j
,
≠≠j k
$num
≠≠l m
,
≠≠m n
true
≠≠o s
,
≠≠s t
$str≠≠u Å
}≠≠Ç É
}
ÆÆ 
)
ÆÆ 
;
ÆÆ 
migrationBuilder
∞∞ 
.
∞∞ 

InsertData
∞∞ '
(
∞∞' (
table
±± 
:
±± 
$str
±± %
,
±±% &
columns
≤≤ 
:
≤≤ 
new
≤≤ 
[
≤≤ 
]
≤≤ 
{
≤≤  
$str
≤≤! 0
,
≤≤0 1
$str
≤≤2 F
,
≤≤F G
$str
≤≤H R
,
≤≤R S
$str
≤≤T _
,
≤≤_ `
$str
≤≤a p
,
≤≤p q
$str
≤≤r z
,
≤≤z {
$str≤≤| Ü
}≤≤á à
,≤≤à â
values
≥≥ 
:
≥≥ 
new
≥≥ 
object
≥≥ "
[
≥≥" #
]
≥≥# $
{
≥≥% &
$num
≥≥' (
,
≥≥( )
null
≥≥* .
,
≥≥. /
$num
≥≥0 1
,
≥≥1 2
$num
≥≥3 4
,
≥≥4 5
new
≥≥6 9
DateOnly
≥≥: B
(
≥≥B C
$num
≥≥C G
,
≥≥G H
$num
≥≥I J
,
≥≥J K
$num
≥≥L N
)
≥≥N O
,
≥≥O P
$num
≥≥Q R
,
≥≥R S
$num
≥≥T U
}
≥≥V W
)
≥≥W X
;
≥≥X Y
migrationBuilder
µµ 
.
µµ 
CreateIndex
µµ (
(
µµ( )
name
∂∂ 
:
∂∂ 
$str
∂∂ G
,
∂∂G H
table
∑∑ 
:
∑∑ 
$str
∑∑ %
,
∑∑% &
columns
∏∏ 
:
∏∏ 
new
∏∏ 
[
∏∏ 
]
∏∏ 
{
∏∏  
$str
∏∏! +
,
∏∏+ ,
$str
∏∏- <
,
∏∏< =
$str
∏∏> H
}
∏∏I J
,
∏∏J K
unique
ππ 
:
ππ 
true
ππ 
)
ππ 
;
ππ 
migrationBuilder
ªª 
.
ªª 
CreateIndex
ªª (
(
ªª( )
name
ºº 
:
ºº 
$str
ºº 1
,
ºº1 2
table
ΩΩ 
:
ΩΩ 
$str
ΩΩ %
,
ΩΩ% &
column
ææ 
:
ææ 
$str
ææ #
)
ææ# $
;
ææ$ %
migrationBuilder
¿¿ 
.
¿¿ 
CreateIndex
¿¿ (
(
¿¿( )
name
¡¡ 
:
¡¡ 
$str
¡¡ (
,
¡¡( )
table
¬¬ 
:
¬¬ 
$str
¬¬  
,
¬¬  !
column
√√ 
:
√√ 
$str
√√ 
,
√√  
unique
ƒƒ 
:
ƒƒ 
true
ƒƒ 
)
ƒƒ 
;
ƒƒ 
migrationBuilder
∆∆ 
.
∆∆ 
CreateIndex
∆∆ (
(
∆∆( )
name
«« 
:
«« 
$str
«« 6
,
««6 7
table
»» 
:
»» 
$str
»» &
,
»»& '
column
…… 
:
…… 
$str
…… '
,
……' (
unique
   
:
   
true
   
)
   
;
   
migrationBuilder
ÃÃ 
.
ÃÃ 
CreateIndex
ÃÃ (
(
ÃÃ( )
name
ÕÕ 
:
ÕÕ 
$str
ÕÕ 1
,
ÕÕ1 2
table
ŒŒ 
:
ŒŒ 
$str
ŒŒ &
,
ŒŒ& '
column
œœ 
:
œœ 
$str
œœ "
)
œœ" #
;
œœ# $
migrationBuilder
—— 
.
—— 
CreateIndex
—— (
(
——( )
name
““ 
:
““ 
$str
““ 2
,
““2 3
table
”” 
:
”” 
$str
”” &
,
””& '
column
‘‘ 
:
‘‘ 
$str
‘‘ #
)
‘‘# $
;
‘‘$ %
migrationBuilder
÷÷ 
.
÷÷ 
CreateIndex
÷÷ (
(
÷÷( )
name
◊◊ 
:
◊◊ 
$str
◊◊ )
,
◊◊) *
table
ÿÿ 
:
ÿÿ 
$str
ÿÿ !
,
ÿÿ! "
column
ŸŸ 
:
ŸŸ 
$str
ŸŸ 
,
ŸŸ  
unique
⁄⁄ 
:
⁄⁄ 
true
⁄⁄ 
)
⁄⁄ 
;
⁄⁄ 
migrationBuilder
‹‹ 
.
‹‹ 
CreateIndex
‹‹ (
(
‹‹( )
name
›› 
:
›› 
$str
›› &
,
››& '
table
ﬁﬁ 
:
ﬁﬁ 
$str
ﬁﬁ 
,
ﬁﬁ 
column
ﬂﬂ 
:
ﬂﬂ 
$str
ﬂﬂ 
,
ﬂﬂ  
unique
‡‡ 
:
‡‡ 
true
‡‡ 
)
‡‡ 
;
‡‡ 
}
·· 	
	protected
‰‰ 
override
‰‰ 
void
‰‰ 
Down
‰‰  $
(
‰‰$ %
MigrationBuilder
‰‰% 5
migrationBuilder
‰‰6 F
)
‰‰F G
{
ÂÂ 	
migrationBuilder
ÊÊ 
.
ÊÊ 
	DropTable
ÊÊ &
(
ÊÊ& '
name
ÁÁ 
:
ÁÁ 
$str
ÁÁ %
)
ÁÁ% &
;
ÁÁ& '
migrationBuilder
ÈÈ 
.
ÈÈ 
	DropTable
ÈÈ &
(
ÈÈ& '
name
ÍÍ 
:
ÍÍ 
$str
ÍÍ %
)
ÍÍ% &
;
ÍÍ& '
migrationBuilder
ÏÏ 
.
ÏÏ 
	DropTable
ÏÏ &
(
ÏÏ& '
name
ÌÌ 
:
ÌÌ 
$str
ÌÌ 
)
ÌÌ 
;
ÌÌ 
migrationBuilder
ÔÔ 
.
ÔÔ 
	DropTable
ÔÔ &
(
ÔÔ& '
name
 
:
 
$str
 $
)
$ %
;
% &
migrationBuilder
ÚÚ 
.
ÚÚ 
	DropTable
ÚÚ &
(
ÚÚ& '
name
ÛÛ 
:
ÛÛ 
$str
ÛÛ 
)
ÛÛ  
;
ÛÛ  !
migrationBuilder
ıı 
.
ıı 
	DropTable
ıı &
(
ıı& '
name
ˆˆ 
:
ˆˆ 
$str
ˆˆ  
)
ˆˆ  !
;
ˆˆ! "
}
˜˜ 	
}
¯¯ 
}˘˘ É
eC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Middleware\RequestLoggingMiddleware.cs
	namespace 	

HealthAxis
 
. 
API 
. 

Middleware #
{ 
public 

class $
RequestLoggingMiddleware )
{ 
private 
readonly 
RequestDelegate (
_next) .
;. /
private 
readonly 
ILogger  
<  !$
RequestLoggingMiddleware! 9
>9 :
_logger; B
;B C
public $
RequestLoggingMiddleware '
(' (
RequestDelegate		 
next		  
,		  !
ILogger

 
<

 $
RequestLoggingMiddleware

 ,
>

, -
logger

. 4
)

4 5
{ 	
_next 
= 
next 
; 
_logger 
= 
logger 
; 
} 	
public 
async 
Task 
InvokeAsync %
(% &
HttpContext& 1
context2 9
)9 :
{ 	
_logger 
. 
LogInformation "
(" #
$str 3
,3 4
context 
. 
Request 
.  
Method  &
,& '
context 
. 
Request 
.  
Path  $
)$ %
;% &
await 
_next 
( 
context 
)  
;  !
_logger 
. 
LogInformation "
(" #
$str 1
,1 2
context 
. 
Response  
.  !

StatusCode! +
)+ ,
;, -
} 	
} 
} ™#
`C:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Middleware\ExceptionMiddleware.cs
	namespace 	
S4_HealthAxisApi
 
. 

Middleware %
{ 
public 

class 
ExceptionMiddleware $
{ 
private 
readonly 
RequestDelegate (
_next) .
;. /
public

 
ExceptionMiddleware

 "
(

" #
RequestDelegate

# 2
next

3 7
)

7 8
{ 	
_next 
= 
next 
; 
} 	
public 
async 
Task 
InvokeAsync %
(% &
HttpContext& 1
context2 9
)9 :
{ 	
try 
{ 
await 
_next 
( 
context #
)# $
;$ %
} 
catch 
( 
	Exception 
ex 
)  
{ 
await  
HandleExceptionAsync *
(* +
context 
, 
ex 
) 
; 
} 
} 	
private 
static 
async 
Task ! 
HandleExceptionAsync" 6
(6 7
HttpContext 
context 
,  
	Exception 
	exception 
)  
{   	
context!! 
.!! 
Response!! 
.!! 
ContentType!! (
=!!) *
$str"" "
;""" #
var$$ 
response$$ 
=$$ 
new$$ 
ErrorResponse$$ ,
{%% 
Message&& 
=&& 
	exception&& #
.&&# $
Message&&$ +
}'' 
;'' 
switch)) 
()) 
	exception)) 
))) 
{** 
case++  
KeyNotFoundException++ )
:++) *
context,, 
.,, 
Response,, $
.,,$ %

StatusCode,,% /
=,,0 1
(-- 
int-- 
)-- 
HttpStatusCode-- +
.--+ ,
NotFound--, 4
;--4 5
break.. 
;.. 
case00 
ArgumentException00 &
:00& '
context11 
.11 
Response11 $
.11$ %

StatusCode11% /
=110 1
(22 
int22 
)22 
HttpStatusCode22 +
.22+ ,

BadRequest22, 6
;226 7
break33 
;33 
case55 %
InvalidOperationException55 .
:55. /
context66 
.66 
Response66 $
.66$ %

StatusCode66% /
=660 1
(77 
int77 
)77 
HttpStatusCode77 +
.77+ ,

BadRequest77, 6
;776 7
break88 
;88 
case:: '
UnauthorizedAccessException:: 0
:::0 1
context;; 
.;; 
Response;; $
.;;$ %

StatusCode;;% /
=;;0 1
(<< 
int<< 
)<< 
HttpStatusCode<< +
.<<+ ,
Unauthorized<<, 8
;<<8 9
break== 
;== 
default?? 
:?? 
context@@ 
.@@ 
Response@@ $
.@@$ %

StatusCode@@% /
=@@0 1
(AA 
intAA 
)AA 
HttpStatusCodeAA +
.AA+ ,
InternalServerErrorAA, ?
;AA? @
responseCC 
.CC 
MessageCC $
=CC% &
$strDD 7
;DD7 8
breakEE 
;EE 
}FF 
varHH 
jsonHH 
=HH 
JsonSerializerII 
.II 
	SerializeII (
(II( )
responseII) 1
)II1 2
;II2 3
awaitKK 
contextKK 
.KK 
ResponseKK "
.KK" #

WriteAsyncKK# -
(KK- .
jsonKK. 2
)KK2 3
;KK3 4
}LL 	
}MM 
publicOO 

classOO 
ErrorResponseOO 
{PP 
publicQQ 
stringQQ 
MessageQQ 
{QQ 
getQQ  #
;QQ# $
setQQ% (
;QQ( )
}QQ* +
=RR 
stringRR 
.RR 
EmptyRR 
;RR 
}SS 
}TT µ
]C:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Messaging\RabbitMqPublisher.cs
	namespace 	
S4_HealthAxisApi
 
. 
	Messaging $
{ 
public 

sealed 
class 
RabbitMqPublisher )
:* +
IRabbitMqPublisher, >
{ 
private 
readonly 
IPublishEndpoint )
_publishEndpoint* :
;: ;
private 
readonly 
ILogger  
<  !
RabbitMqPublisher! 2
>2 3
_logger4 ;
;; <
public

 
RabbitMqPublisher

  
(

  !
IPublishEndpoint 
publishEndpoint ,
,, -
ILogger 
< 
RabbitMqPublisher %
>% &
logger' -
)- .
{ 	
_publishEndpoint 
= 
publishEndpoint .
;. /
_logger 
= 
logger 
; 
} 	
public 
async 
Task 
PublishAsync &
<& '
TMessage' /
>/ 0
(0 1
TMessage 
message 
, 
CancellationToken 
cancellationToken /
=0 1
default2 9
)9 :
where 
TMessage 
: 
class "
{ 	
await 
_publishEndpoint "
." #
Publish# *
(* +
message 
, 
cancellationToken !
)! "
;" #
_logger 
. 
LogInformation "
(" #
$str H
,H I
typeof 
( 
TMessage 
)  
.  !
Name! %
)% &
;& '
} 	
} 
}   ∞
^C:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Messaging\IRabbitMqPublisher.cs
	namespace 	
S4_HealthAxisApi
 
. 
	Messaging $
{ 
public 

	interface 
IRabbitMqPublisher '
{ 
Task 
PublishAsync 
< 
TMessage "
>" #
(# $
TMessage 
message 
, 
CancellationToken 
cancellationToken /
=0 1
default2 9
)9 :
where 
TMessage 
: 
class "
;" #
}		 
}

 ˜	
_C:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Events\AppointmentBookedEvent.cs
	namespace 	
S4_HealthAxisApi
 
. 
Events !
{ 
public 

class "
AppointmentBookedEvent '
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
public 
string 
PatientName !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
string2 8
.8 9
Empty9 >
;> ?
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
public 
string 
TimeSlot 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
} 
} ˆp
SC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Data\AppDbContext.cs
	namespace 	

HealthAxis
 
. 
API 
. 
Data 
{ 
public 

class 
HealthAxisDbContext $
:% &
	DbContext' 0
{ 
public		 
HealthAxisDbContext		 "
(		" #
DbContextOptions		# 3
<		3 4
HealthAxisDbContext		4 G
>		G H
options		I P
)		P Q
:

 
base

 
(

 
options

 
)

 
{ 	
} 	
public 
DbSet 
< 
Patient 
> 
Patients &
=>' )
Set* -
<- .
Patient. 5
>5 6
(6 7
)7 8
;8 9
public 
DbSet 
< 
Doctor 
> 
Doctors $
=>% '
Set( +
<+ ,
Doctor, 2
>2 3
(3 4
)4 5
;5 6
public 
DbSet 
< 
Appointment  
>  !
Appointments" .
=>/ 1
Set2 5
<5 6
Appointment6 A
>A B
(B C
)C D
;D E
public 
DbSet 
< 
HealthRecord !
>! "
HealthRecords# 0
=>1 3
Set4 7
<7 8
HealthRecord8 D
>D E
(E F
)F G
;G H
public 
DbSet 
< 
User 
> 
AppUsers #
=>$ &
Set' *
<* +
User+ /
>/ 0
(0 1
)1 2
;2 3
public 
DbSet 
< 
Notification !
>! "
Notifications# 0
=>1 3
Set4 7
<7 8
Notification8 D
>D E
(E F
)F G
;G H
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
builder= D
)D E
{ 	
base 
. 
OnModelCreating  
(  !
builder! (
)( )
;) *
builder 
. 
Entity 
< 
User 
>  
(  !
)! "
." #
ToTable# *
(* +
$str+ 2
)2 3
;3 4
builder   
.   
Entity   
<   
User   
>    
(    !
)  ! "
.!! 
HasIndex!! 
(!! 
user!! 
=>!! !
user!!" &
.!!& '
Email!!' ,
)!!, -
."" 
IsUnique"" 
("" 
)"" 
;"" 
builder$$ 
.$$ 
Entity$$ 
<$$ 
Doctor$$ !
>$$! "
($$" #
)$$# $
.%% 
HasIndex%% 
(%% 
doctor%%  
=>%%! #
doctor%%$ *
.%%* +
Email%%+ 0
)%%0 1
.&& 
IsUnique&& 
(&& 
)&& 
;&& 
builder(( 
.(( 
Entity(( 
<(( 
Patient(( "
>((" #
(((# $
)(($ %
.)) 
HasIndex)) 
()) 
patient)) !
=>))" $
patient))% ,
.)), -
Email))- 2
)))2 3
.** 
IsUnique** 
(** 
)** 
;** 
builder,, 
.,, 
Entity,, 
<,, 
Appointment,, &
>,,& '
(,,' (
),,( )
.-- 
HasOne-- 
(-- 
appointment-- #
=>--$ &
appointment--' 2
.--2 3
Patient--3 :
)--: ;
... 
WithMany.. 
(.. 
patient.. !
=>.." $
patient..% ,
..., -
Appointments..- 9
)..9 :
.// 
HasForeignKey// 
(// 
appointment// *
=>//+ -
appointment//. 9
.//9 :
	PatientId//: C
)//C D
.00 
OnDelete00 
(00 
DeleteBehavior00 (
.00( )
Restrict00) 1
)001 2
;002 3
builder22 
.22 
Entity22 
<22 
Appointment22 &
>22& '
(22' (
)22( )
.33 
HasOne33 
(33 
appointment33 #
=>33$ &
appointment33' 2
.332 3
Doctor333 9
)339 :
.44 
WithMany44 
(44 
doctor44  
=>44! #
doctor44$ *
.44* +
Appointments44+ 7
)447 8
.55 
HasForeignKey55 
(55 
appointment55 *
=>55+ -
appointment55. 9
.559 :
DoctorId55: B
)55B C
.66 
OnDelete66 
(66 
DeleteBehavior66 (
.66( )
Restrict66) 1
)661 2
;662 3
builder88 
.88 
Entity88 
<88 
Appointment88 &
>88& '
(88' (
)88( )
.99 
HasIndex99 
(99 
appointment99 %
=>99& (
new99) ,
{:: 
appointment;; 
.;;  
DoctorId;;  (
,;;( )
appointment<< 
.<<  
ScheduledDate<<  -
,<<- .
appointment== 
.==  
TimeSlot==  (
}>> 
)>> 
.?? 
IsUnique?? 
(?? 
)?? 
;?? 
builderAA 
.AA 
EntityAA 
<AA 
HealthRecordAA '
>AA' (
(AA( )
)AA) *
.BB 
HasOneBB 
(BB 
healthRecordBB $
=>BB% '
healthRecordBB( 4
.BB4 5
AppointmentBB5 @
)BB@ A
.CC 
WithOneCC 
(CC 
appointmentCC $
=>CC% '
appointmentCC( 3
.CC3 4
HealthRecordCC4 @
)CC@ A
.DD 
HasForeignKeyDD 
<DD 
HealthRecordDD +
>DD+ ,
(DD, -
healthRecordDD- 9
=>DD: <
healthRecordDD= I
.DDI J
AppointmentIdDDJ W
)DDW X
.EE 
OnDeleteEE 
(EE 
DeleteBehaviorEE (
.EE( )
RestrictEE) 1
)EE1 2
;EE2 3
builderGG 
.GG 
EntityGG 
<GG 
HealthRecordGG '
>GG' (
(GG( )
)GG) *
.HH 
HasOneHH 
(HH 
healthRecordHH $
=>HH% '
healthRecordHH( 4
.HH4 5
PatientHH5 <
)HH< =
.II 
WithManyII 
(II 
patientII !
=>II" $
patientII% ,
.II, -
HealthRecordsII- :
)II: ;
.JJ 
HasForeignKeyJJ 
(JJ 
healthRecordJJ +
=>JJ, .
healthRecordJJ/ ;
.JJ; <
	PatientIdJJ< E
)JJE F
.KK 
OnDeleteKK 
(KK 
DeleteBehaviorKK (
.KK( )
RestrictKK) 1
)KK1 2
;KK2 3
builderMM 
.MM 
EntityMM 
<MM 
HealthRecordMM '
>MM' (
(MM( )
)MM) *
.NN 
HasOneNN 
(NN 
healthRecordNN $
=>NN% '
healthRecordNN( 4
.NN4 5
DoctorNN5 ;
)NN; <
.OO 
WithManyOO 
(OO 
doctorOO  
=>OO! #
doctorOO$ *
.OO* +
HealthRecordsOO+ 8
)OO8 9
.PP 
HasForeignKeyPP 
(PP 
healthRecordPP +
=>PP, .
healthRecordPP/ ;
.PP; <
DoctorIdPP< D
)PPD E
.QQ 
OnDeleteQQ 
(QQ 
DeleteBehaviorQQ (
.QQ( )
RestrictQQ) 1
)QQ1 2
;QQ2 3
builderSS 
.SS 
EntitySS 
<SS 
HealthRecordSS '
>SS' (
(SS( )
)SS) *
.TT 
HasIndexTT 
(TT 
healthRecordTT &
=>TT' )
healthRecordTT* 6
.TT6 7
AppointmentIdTT7 D
)TTD E
.UU 
IsUniqueUU 
(UU 
)UU 
;UU 
builderWW 
.WW 
EntityWW 
<WW 
DoctorWW !
>WW! "
(WW" #
)WW# $
.XX 
PropertyXX 
(XX 
doctorXX  
=>XX! #
doctorXX$ *
.XX* +
ConsultationFeeXX+ :
)XX: ;
.YY 
HasPrecisionYY 
(YY 
$numYY  
,YY  !
$numYY" #
)YY# $
;YY$ %
builder[[ 
.[[ 
Entity[[ 
<[[ 
Notification[[ '
>[[' (
([[( )
)[[) *
.\\ 
Property\\ 
(\\ 
notification\\ &
=>\\' )
notification\\* 6
.\\6 7
Message\\7 >
)\\> ?
.]] 
HasMaxLength]] 
(]] 
$num]] !
)]]! "
;]]" #
builder__ 
.__ 
Entity__ 
<__ 
Patient__ "
>__" #
(__# $
)__$ %
.__% &
HasData__& -
(__- .
new`` 
Patient`` 
{aa 
	PatientIdbb 
=bb 
$numbb  !
,bb! "
FullNamecc 
=cc 
$strcc -
,cc- .
DateOfBirthdd 
=dd  !
newdd" %
DateOnlydd& .
(dd. /
$numdd/ 3
,dd3 4
$numdd5 6
,dd6 7
$numdd8 :
)dd: ;
,dd; <
Genderee 
=ee 
Genderee #
.ee# $
Maleee$ (
,ee( )
PhoneNumberff 
=ff  !
$strff" .
,ff. /
Emailgg 
=gg 
$strgg 6
,gg6 7
InsuranceStatushh #
=hh$ %
InsuranceStatushh& 5
.hh5 6
Activehh6 <
,hh< =
InsuranceNumberii #
=ii$ %
$strii& /
,ii/ 0
IsActivejj 
=jj 
truejj #
}kk 
,kk 
newll 
Patientll 
{mm 
	PatientIdnn 
=nn 
$numnn  !
,nn! "
FullNameoo 
=oo 
$stroo ,
,oo, -
DateOfBirthpp 
=pp  !
newpp" %
DateOnlypp& .
(pp. /
$numpp/ 3
,pp3 4
$numpp5 7
,pp7 8
$numpp9 :
)pp: ;
,pp; <
Genderqq 
=qq 
Genderqq #
.qq# $
Femaleqq$ *
,qq* +
PhoneNumberrr 
=rr  !
$strrr" .
,rr. /
Emailss 
=ss 
$strss 5
,ss5 6
InsuranceStatustt #
=tt$ %
InsuranceStatustt& 5
.tt5 6
Activett6 <
,tt< =
InsuranceNumberuu #
=uu$ %
$struu& /
,uu/ 0
IsActivevv 
=vv 
truevv #
}ww 
)xx 
;xx 
builderzz 
.zz 
Entityzz 
<zz 
Doctorzz !
>zz! "
(zz" #
)zz# $
.zz$ %
HasDatazz% ,
(zz, -
new{{ 
Doctor{{ 
{|| 
DoctorId}} 
=}} 
$num}}  
,}}  !
FullName~~ 
=~~ 
$str~~ *
,~~* +
Email 
= 
$str 6
,6 7
Specialisation
ÄÄ "
=
ÄÄ# $"
DoctorSpecialisation
ÄÄ% 9
.
ÄÄ9 :!
GeneralPractitioner
ÄÄ: M
,
ÄÄM N
YearsOfExperience
ÅÅ %
=
ÅÅ& '
$num
ÅÅ( )
,
ÅÅ) *
ConsultationFee
ÇÇ #
=
ÇÇ$ %
$num
ÇÇ& -
,
ÇÇ- .
IsActive
ÉÉ 
=
ÉÉ 
true
ÉÉ #
}
ÑÑ 
,
ÑÑ 
new
ÖÖ 
Doctor
ÖÖ 
{
ÜÜ 
DoctorId
áá 
=
áá 
$num
áá  
,
áá  !
FullName
àà 
=
àà 
$str
àà ,
,
àà, -
Email
ââ 
=
ââ 
$str
ââ 8
,
ââ8 9
Specialisation
ää "
=
ää# $"
DoctorSpecialisation
ää% 9
.
ää9 :
Cardiologist
ää: F
,
ääF G
YearsOfExperience
ãã %
=
ãã& '
$num
ãã( *
,
ãã* +
ConsultationFee
åå #
=
åå$ %
$num
åå& .
,
åå. /
IsActive
çç 
=
çç 
true
çç #
}
éé 
)
èè 
;
èè 
builder
ëë 
.
ëë 
Entity
ëë 
<
ëë 
Appointment
ëë &
>
ëë& '
(
ëë' (
)
ëë( )
.
ëë) *
HasData
ëë* 1
(
ëë1 2
new
íí 
Appointment
íí 
{
ìì 
AppointmentId
îî !
=
îî" #
$num
îî$ %
,
îî% &
	PatientId
ïï 
=
ïï 
$num
ïï  !
,
ïï! "
DoctorId
ññ 
=
ññ 
$num
ññ  
,
ññ  !
ScheduledDate
óó !
=
óó" #
new
óó$ '
DateOnly
óó( 0
(
óó0 1
$num
óó1 5
,
óó5 6
$num
óó7 8
,
óó8 9
$num
óó: <
)
óó< =
,
óó= >
TimeSlot
òò 
=
òò !
AppointmentTimeSlot
òò 2
.
òò2 3
TenAM
òò3 8
,
òò8 9
Status
ôô 
=
ôô 
AppointmentStatus
ôô .
.
ôô. /
Pending
ôô/ 6
}
öö 
)
õõ 
;
õõ 
}
úú 	
}
ùù 
}ûû ác
_C:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Controllers\PatientController.cs
	namespace 	
S4_HealthAxisApi
 
. 
Controllers &
{ 
[ 
Route 

(
 
$str 
) 
] 
[		 
ApiController		 
]		 
[

 
	Authorize

 
]

 
public 

class 
PatientsController #
:$ %
ControllerBase& 4
{ 
private 
readonly 
IPatientService (
_patientService) 8
;8 9
private 
readonly  
IHealthRecordService - 
_healthRecordService. B
;B C
public 
PatientsController !
(! "
IPatientService 
patientService *
,* + 
IHealthRecordService  
healthRecordService! 4
)4 5
{ 	
_patientService 
= 
patientService ,
;, - 
_healthRecordService  
=! "
healthRecordService# 6
;6 7
} 	
[ 	
HttpGet	 
] 
[ 	
	Authorize	 
( 
Roles 
= 
$str "
)" #
]# $
public 
async 
Task 
< 
IActionResult '
>' (
GetAll) /
(/ 0
)0 1
{ 	
var 
patients 
= 
await  
_patientService! 0
.0 1
GetAllAsync1 <
(< =
)= >
;> ?
return 
Ok 
( 
patients 
) 
;  
} 	
[!! 	
HttpGet!!	 
(!! 
$str!! 
)!! 
]!! 
["" 	
	Authorize""	 
("" 
Roles"" 
="" 
$str"" 1
)""1 2
]""2 3
public## 
async## 
Task## 
<## 
IActionResult## '
>##' (
GetById##) 0
(##0 1
int##1 4
id##5 7
)##7 8
{$$ 	
if%% 
(%% 
User%% 
.%% 
IsInRole%% 
(%% 
$str%% '
)%%' (
)%%( )
{&& 
var'' 
patientIdFromToken'' &
=''' (*
GetPatientReferenceIdFromToken'') G
(''G H
)''H I
;''I J
if)) 
()) 
!)) 
patientIdFromToken)) '
.))' (
HasValue))( 0
||))1 3
patientIdFromToken** &
.**& '
Value**' ,
!=**- /
id**0 2
)**2 3
{++ 
return,, 
Forbid,, !
(,,! "
),," #
;,,# $
}-- 
}.. 
var00 
patient00 
=00 
await00 
_patientService00  /
.00/ 0
GetByIdAsync000 <
(00< =
id00= ?
)00? @
;00@ A
if22 
(22 
patient22 
==22 
null22 
)22  
{33 
return44 
NotFound44 
(44  
$"44  "
$str44" 2
{442 3
id443 5
}445 6
$str446 A
"44A B
)44B C
;44C D
}55 
return77 
Ok77 
(77 
patient77 
)77 
;77 
}88 	
[:: 	
HttpGet::	 
(:: 
$str:: *
)::* +
]::+ ,
[;; 	
	Authorize;;	 
(;; 
Roles;; 
=;; 
$str;; 1
);;1 2
];;2 3
public<< 
async<< 
Task<< 
<<< 
IActionResult<< '
><<' (
GetHealthRecords<<) 9
(<<9 :
int<<: =
id<<> @
)<<@ A
{== 	
if>> 
(>> 
User>> 
.>> 
IsInRole>> 
(>> 
$str>> '
)>>' (
)>>( )
{?? 
var@@ 
patientIdFromToken@@ &
=@@' (*
GetPatientReferenceIdFromToken@@) G
(@@G H
)@@H I
;@@I J
ifBB 
(BB 
!BB 
patientIdFromTokenBB '
.BB' (
HasValueBB( 0
||BB1 3
patientIdFromTokenCC &
.CC& '
ValueCC' ,
!=CC- /
idCC0 2
)CC2 3
{DD 
returnEE 
ForbidEE !
(EE! "
)EE" #
;EE# $
}FF 
}GG 
tryII 
{JJ 
varKK 
recordsKK 
=KK 
awaitLL  
_healthRecordServiceLL .
.LL. /
GetByPatientIdAsyncLL/ B
(LLB C
idLLC E
)LLE F
;LLF G
returnNN 
OkNN 
(NN 
recordsNN !
)NN! "
;NN" #
}OO 
catchPP 
(PP  
KeyNotFoundExceptionPP '
exPP( *
)PP* +
{QQ 
returnRR 
NotFoundRR 
(RR  
exRR  "
.RR" #
MessageRR# *
)RR* +
;RR+ ,
}SS 
}TT 	
[VV 	
HttpGetVV	 
(VV 
$strVV 
)VV 
]VV 
[WW 	
	AuthorizeWW	 
(WW 
RolesWW 
=WW 
$strWW )
)WW) *
]WW* +
publicXX 
asyncXX 
TaskXX 
<XX 
IActionResultXX '
>XX' (
SearchXX) /
(XX/ 0
[YY 
	FromQueryYY 
]YY 
stringYY 
nameYY #
)YY# $
{ZZ 	
var[[ 
patients[[ 
=[[ 
await\\ 
_patientService\\ %
.\\% &
SearchByNameAsync\\& 7
(\\7 8
name\\8 <
)\\< =
;\\= >
return^^ 
Ok^^ 
(^^ 
patients^^ 
)^^ 
;^^  
}__ 	
[aa 	
HttpPostaa	 
]aa 
publicbb 
asyncbb 
Taskbb 
<bb 
IActionResultbb '
>bb' (
Createbb) /
(bb/ 0
CreatePatientDtocc 
dtocc  
)cc  !
{dd 	
tryee 
{ff 
vargg 
patientgg 
=gg 
awaithh 
_patientServicehh )
.hh) *
CreateAsynchh* 5
(hh5 6
dtohh6 9
)hh9 :
;hh: ;
returnjj 
CreatedAtActionjj &
(jj& '
nameofkk 
(kk 
GetByIdkk "
)kk" #
,kk# $
newll 
{ll 
idll 
=ll 
patientll &
.ll& '
	PatientIdll' 0
}ll1 2
,ll2 3
patientmm 
)mm 
;mm 
}nn 
catchoo 
(oo 
ArgumentExceptionoo $
exoo% '
)oo' (
{pp 
returnqq 

BadRequestqq !
(qq! "
exqq" $
.qq$ %
Messageqq% ,
)qq, -
;qq- .
}rr 
}ss 	
[uu 	
HttpPutuu	 
(uu 
$struu 
)uu 
]uu 
publicvv 
asyncvv 
Taskvv 
<vv 
IActionResultvv '
>vv' (
Updatevv) /
(vv/ 0
intww 
idww 
,ww 
UpdatePatientDtoxx 
dtoxx  
)xx  !
{yy 	
tryzz 
{{{ 
if|| 
(|| 
User|| 
.|| 
IsInRole|| !
(||! "
$str||" +
)||+ ,
)||, -
{}} 
var~~ 
patientIdFromToken~~ *
=~~+ ,*
GetPatientReferenceIdFromToken~~- K
(~~K L
)~~L M
;~~M N
if
ÄÄ 
(
ÄÄ 
!
ÄÄ  
patientIdFromToken
ÄÄ +
.
ÄÄ+ ,
HasValue
ÄÄ, 4
||
ÄÄ5 7 
patientIdFromToken
ÅÅ *
.
ÅÅ* +
Value
ÅÅ+ 0
!=
ÅÅ1 3
id
ÅÅ4 6
)
ÅÅ6 7
{
ÇÇ 
return
ÉÉ 
Forbid
ÉÉ %
(
ÉÉ% &
)
ÉÉ& '
;
ÉÉ' (
}
ÑÑ 
}
ÖÖ 
await
áá 
_patientService
áá %
.
áá% &
UpdateAsync
áá& 1
(
áá1 2
id
áá2 4
,
áá4 5
dto
áá6 9
)
áá9 :
;
áá: ;
return
ââ 
	NoContent
ââ  
(
ââ  !
)
ââ! "
;
ââ" #
}
ää 
catch
ãã 
(
ãã "
KeyNotFoundException
ãã '
ex
ãã( *
)
ãã* +
{
åå 
return
çç 
NotFound
çç 
(
çç  
ex
çç  "
.
çç" #
Message
çç# *
)
çç* +
;
çç+ ,
}
éé 
catch
èè 
(
èè 
ArgumentException
èè $
ex
èè% '
)
èè' (
{
êê 
return
ëë 

BadRequest
ëë !
(
ëë! "
ex
ëë" $
.
ëë$ %
Message
ëë% ,
)
ëë, -
;
ëë- .
}
íí 
}
ìì 	
[
ïï 	
HttpPut
ïï	 
(
ïï 
$str
ïï $
)
ïï$ %
]
ïï% &
[
ññ 	
	Authorize
ññ	 
(
ññ 
Roles
ññ 
=
ññ 
$str
ññ "
)
ññ" #
]
ññ# $
public
óó 
async
óó 
Task
óó 
<
óó 
IActionResult
óó '
>
óó' (
Activate
óó) 1
(
óó1 2
int
óó2 5
id
óó6 8
)
óó8 9
{
òò 	
try
ôô 
{
öö 
await
õõ 
_patientService
õõ %
.
õõ% &
ActivateAsync
õõ& 3
(
õõ3 4
id
õõ4 6
)
õõ6 7
;
õõ7 8
return
ùù 
	NoContent
ùù  
(
ùù  !
)
ùù! "
;
ùù" #
}
ûû 
catch
üü 
(
üü "
KeyNotFoundException
üü '
ex
üü( *
)
üü* +
{
†† 
return
°° 
NotFound
°° 
(
°°  
ex
°°  "
.
°°" #
Message
°°# *
)
°°* +
;
°°+ ,
}
¢¢ 
}
££ 	
[
•• 	
HttpPut
••	 
(
•• 
$str
•• &
)
••& '
]
••' (
[
¶¶ 	
	Authorize
¶¶	 
(
¶¶ 
Roles
¶¶ 
=
¶¶ 
$str
¶¶ "
)
¶¶" #
]
¶¶# $
public
ßß 
async
ßß 
Task
ßß 
<
ßß 
IActionResult
ßß '
>
ßß' (

Deactivate
ßß) 3
(
ßß3 4
int
ßß4 7
id
ßß8 :
)
ßß: ;
{
®® 	
try
©© 
{
™™ 
await
´´ 
_patientService
´´ %
.
´´% &
DeactivateAsync
´´& 5
(
´´5 6
id
´´6 8
)
´´8 9
;
´´9 :
return
≠≠ 
	NoContent
≠≠  
(
≠≠  !
)
≠≠! "
;
≠≠" #
}
ÆÆ 
catch
ØØ 
(
ØØ "
KeyNotFoundException
ØØ '
ex
ØØ( *
)
ØØ* +
{
∞∞ 
return
±± 
NotFound
±± 
(
±±  
ex
±±  "
.
±±" #
Message
±±# *
)
±±* +
;
±±+ ,
}
≤≤ 
}
≥≥ 	
private
µµ 
int
µµ 
?
µµ ,
GetPatientReferenceIdFromToken
µµ 3
(
µµ3 4
)
µµ4 5
{
∂∂ 	
var
∑∑ 
referenceIdValue
∑∑  
=
∑∑! "
User
∑∑# '
.
∑∑' (
	FindFirst
∑∑( 1
(
∑∑1 2
$str
∑∑2 ?
)
∑∑? @
?
∑∑@ A
.
∑∑A B
Value
∑∑B G
;
∑∑G H
if
ππ 
(
ππ 
int
ππ 
.
ππ 
TryParse
ππ 
(
ππ 
referenceIdValue
ππ -
,
ππ- .
out
ππ/ 2
var
ππ3 6
referenceId
ππ7 B
)
ππB C
)
ππC D
{
∫∫ 
return
ªª 
referenceId
ªª "
;
ªª" #
}
ºº 
return
ææ 
null
ææ 
;
ææ 
}
øø 	
}
¿¿ 
}¡¡ —C
dC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Controllers\HealthRecordController.cs
	namespace 	
S4_HealthAxisApi
 
. 
Controllers &
{ 
[		 
Route		 

(		
 
$str		 
)		 
]		 
[

 
ApiController

 
]

 
[ 
	Authorize 
] 
public 

class #
HealthRecordsController (
:) *
ControllerBase+ 9
{ 
private 
readonly  
IHealthRecordService - 
_healthRecordService. B
;B C
private 
readonly 
IAppointmentService ,
_appointmentService- @
;@ A
public #
HealthRecordsController &
(& ' 
IHealthRecordService  
healthRecordService! 4
,4 5
IAppointmentService 
appointmentService  2
)2 3
{ 	 
_healthRecordService  
=! "
healthRecordService# 6
;6 7
_appointmentService 
=  !
appointmentService" 4
;4 5
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (
GetById) 0
(0 1
int1 4
id5 7
)7 8
{ 	
var 
record 
= 
await  
_healthRecordService *
.* +
GetByIdAsync+ 7
(7 8
id8 :
): ;
;; <
if 
( 
record 
== 
null 
) 
{   
return!! 
NotFound!! 
(!!  
$""" 
$str"" $
{""$ %
id""% '
}""' (
$str""( 3
"""3 4
)""4 5
;""5 6
}## 
return%% 
Ok%% 
(%% 
record%% 
)%% 
;%% 
}&& 	
[(( 	
HttpGet((	 
((( 
$str(( 2
)((2 3
]((3 4
public)) 
async)) 
Task)) 
<)) 
IActionResult)) '
>))' (
GetByAppointment))) 9
())9 :
int** 
appointmentId** 
)** 
{++ 	
var,, 
appointment,, 
=,, 
await-- 
_appointmentService-- )
.--) *
GetByIdAsync--* 6
(--6 7
appointmentId--7 D
)--D E
;--E F
if// 
(// 
appointment// 
==// 
null// #
)//# $
{00 
return11 
NotFound11 
(11  
$"22 
$str22 "
{22" #
appointmentId22# 0
}220 1
$str221 <
"22< =
)22= >
;22> ?
}33 
if55 
(55 
User55 
.55 
IsInRole55 
(55 
$str55 '
)55' (
)55( )
{66 
var77 
patientIdFromToken77 &
=77' (*
GetPatientReferenceIdFromToken77) G
(77G H
)77H I
;77I J
if99 
(99 
!99 
patientIdFromToken99 '
.99' (
HasValue99( 0
||991 3
appointment:: 
.::  
	PatientId::  )
!=::* ,
patientIdFromToken::- ?
.::? @
Value::@ E
)::E F
{;; 
return<< 
Forbid<< !
(<<! "
)<<" #
;<<# $
}== 
}>> 
var@@ 
record@@ 
=@@ 
awaitAA  
_healthRecordServiceAA *
.BB #
GetByAppointmentIdAsyncBB ,
(BB, -
appointmentIdBB- :
)BB: ;
;BB; <
ifDD 
(DD 
recordDD 
==DD 
nullDD 
)DD 
{EE 
returnFF 
NotFoundFF 
(FF  
$strGG C
)GGC D
;GGD E
}HH 
returnJJ 
OkJJ 
(JJ 
recordJJ 
)JJ 
;JJ 
}KK 	
[MM 	
HttpPostMM	 
]MM 
[NN 	
	AuthorizeNN	 
(NN 
RolesNN 
=NN 
$strNN )
)NN) *
]NN* +
publicOO 
asyncOO 
TaskOO 
<OO 
IActionResultOO '
>OO' (
CreateOO) /
(OO/ 0
[PP 
FromBodyPP 
]PP !
CreateHealthRecordDtoPP ,
dtoPP- 0
)PP0 1
{QQ 	
tryRR 
{SS 
varTT 
recordTT 
=TT 
awaitUU  
_healthRecordServiceUU .
.UU. /
CreateAsyncUU/ :
(UU: ;
dtoUU; >
)UU> ?
;UU? @
returnWW 
CreatedAtActionWW &
(WW& '
nameofXX 
(XX 
GetByIdXX "
)XX" #
,XX# $
newYY 
{YY 
idYY 
=YY 
recordYY %
.YY% &
HealthRecordIdYY& 4
}YY5 6
,YY6 7
recordZZ 
)ZZ 
;ZZ 
}[[ 
catch\\ 
(\\  
KeyNotFoundException\\ '
ex\\( *
)\\* +
{]] 
return^^ 
NotFound^^ 
(^^  
ex^^  "
.^^" #
Message^^# *
)^^* +
;^^+ ,
}__ 
catch`` 
(`` 
ArgumentException`` $
ex``% '
)``' (
{aa 
returnbb 

BadRequestbb !
(bb! "
exbb" $
.bb$ %
Messagebb% ,
)bb, -
;bb- .
}cc 
catchdd 
(dd %
InvalidOperationExceptiondd ,
exdd- /
)dd/ 0
{ee 
returnff 

BadRequestff !
(ff! "
exff" $
.ff$ %
Messageff% ,
)ff, -
;ff- .
}gg 
}hh 	
[jj 	
HttpPutjj	 
(jj 
$strjj 
)jj 
]jj 
[kk 	
	Authorizekk	 
(kk 
Roleskk 
=kk 
$strkk )
)kk) *
]kk* +
publicll 
asyncll 
Taskll 
<ll 
IActionResultll '
>ll' (
Updatell) /
(ll/ 0
intmm 
idmm 
,mm 
[nn 
FromBodynn 
]nn !
UpdateHealthRecordDtonn ,
dtonn- 0
)nn0 1
{oo 	
trypp 
{qq 
awaitrr  
_healthRecordServicerr *
.ss 
UpdateAsyncss  
(ss  !
idss! #
,ss# $
dtoss% (
)ss( )
;ss) *
returnuu 
	NoContentuu  
(uu  !
)uu! "
;uu" #
}vv 
catchww 
(ww  
KeyNotFoundExceptionww '
exww( *
)ww* +
{xx 
returnyy 
NotFoundyy 
(yy  
exyy  "
.yy" #
Messageyy# *
)yy* +
;yy+ ,
}zz 
catch{{ 
({{ 
ArgumentException{{ $
ex{{% '
){{' (
{|| 
return}} 

BadRequest}} !
(}}! "
ex}}" $
.}}$ %
Message}}% ,
)}}, -
;}}- .
}~~ 
} 	
private
ÅÅ 
int
ÅÅ 
?
ÅÅ ,
GetPatientReferenceIdFromToken
ÅÅ 3
(
ÅÅ3 4
)
ÅÅ4 5
{
ÇÇ 	
var
ÉÉ 
referenceIdValue
ÉÉ  
=
ÉÉ! "
User
ÉÉ# '
.
ÉÉ' (
	FindFirst
ÉÉ( 1
(
ÉÉ1 2
$str
ÉÉ2 ?
)
ÉÉ? @
?
ÉÉ@ A
.
ÉÉA B
Value
ÉÉB G
;
ÉÉG H
if
ÖÖ 
(
ÖÖ 
int
ÖÖ 
.
ÖÖ 
TryParse
ÖÖ 
(
ÖÖ 
referenceIdValue
ÖÖ -
,
ÖÖ- .
out
ÖÖ/ 2
var
ÖÖ3 6
referenceId
ÖÖ7 B
)
ÖÖB C
)
ÖÖC D
{
ÜÜ 
return
áá 
referenceId
áá "
;
áá" #
}
àà 
return
ää 
null
ää 
;
ää 
}
ãã 	
}
åå 
}çç ÌR
^C:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Controllers\DoctorController.cs
	namespace 	
S4_HealthAxisApi
 
. 
Controllers &
{ 
[ 
Route 

(
 
$str 
) 
] 
[		 
ApiController		 
]		 
[

 
	Authorize

 
]

 
public 

class 
DoctorsController "
:# $
ControllerBase% 3
{ 
private 
readonly 
IDoctorService '
_doctorService( 6
;6 7
private 
readonly 
IAppointmentService ,
_appointmentService- @
;@ A
public 
DoctorsController  
(  !
IDoctorService 
doctorService (
,( )
IAppointmentService 
appointmentService  2
)2 3
{ 	
_doctorService 
= 
doctorService *
;* +
_appointmentService 
=  !
appointmentService" 4
;4 5
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
GetAll) /
(/ 0
[ 
	FromQuery 
] 
string 
? 
sortBy  &
,& '
[ 
	FromQuery 
] 
int 
? 
specialisation +
)+ ,
{ 	
var 
doctors 
= 
await 
_doctorService $
.$ %
GetAllAsync% 0
(0 1
sortBy 
, 
specialisation   "
)  " #
;  # $
return"" 
Ok"" 
("" 
doctors"" 
)"" 
;"" 
}## 	
[%% 	
HttpGet%%	 
(%% 
$str%% 
)%% 
]%% 
public&& 
async&& 
Task&& 
<&& 
IActionResult&& '
>&&' (
GetById&&) 0
(&&0 1
int'' 
id'' 
)'' 
{(( 	
var)) 
doctor)) 
=)) 
await** 
_doctorService** $
.**$ %
GetByIdAsync**% 1
(**1 2
id**2 4
)**4 5
;**5 6
if,, 
(,, 
doctor,, 
==,, 
null,, 
),, 
{-- 
return.. 
NotFound.. 
(..  
$"// 
$str// %
{//% &
id//& (
}//( )
$str//) 4
"//4 5
)//5 6
;//6 7
}00 
return22 
Ok22 
(22 
doctor22 
)22 
;22 
}33 	
[55 	
HttpGet55	 
(55 
$str55 6
)556 7
]557 8
public66 
async66 
Task66 
<66 
IActionResult66 '
>66' (
GetBySpecialisation77 
(77  
int88 
specialisation88 "
)88" #
{99 	
var:: 
doctors:: 
=:: 
await;; 
_doctorService;; $
.<< *
GetActiveBySpecialisationAsync<< 3
(<<3 4
specialisation== &
)==& '
;==' (
return?? 
Ok?? 
(?? 
doctors?? 
)?? 
;?? 
}@@ 	
[BB 	
HttpPostBB	 
]BB 
[CC 	
	AuthorizeCC	 
(CC 
RolesCC 
=CC 
$strCC "
)CC" #
]CC# $
publicDD 
asyncDD 
TaskDD 
<DD 
IActionResultDD '
>DD' (
CreateDD) /
(DD/ 0
[EE 
FromBodyEE 
]EE 
CreateDoctorDtoEE &
dtoEE' *
)EE* +
{FF 	
varGG 
doctorGG 
=GG 
awaitHH 
_doctorServiceHH $
.II (
CreateDoctorWithAccountAsyncII 1
(II1 2
dtoII2 5
)II5 6
;II6 7
returnKK 
CreatedAtActionKK "
(KK" #
nameofLL 
(LL 
GetByIdLL 
)LL 
,LL  
newMM 
{MM 
idMM 
=MM 
doctorMM !
.MM! "
DoctorIdMM" *
}MM+ ,
,MM, -
doctorNN 
)NN 
;NN 
}OO 	
[QQ 	
HttpPutQQ	 
(QQ 
$strQQ 
)QQ 
]QQ 
[RR 	
	AuthorizeRR	 
(RR 
RolesRR 
=RR 
$strRR "
)RR" #
]RR# $
publicSS 
asyncSS 
TaskSS 
<SS 
IActionResultSS '
>SS' (
UpdateSS) /
(SS/ 0
intTT 
idTT 
,TT 
[UU 
FromBodyUU 
]UU 
UpdateDoctorDtoUU &
dtoUU' *
)UU* +
{VV 	
awaitWW 
_doctorServiceWW  
.WW  !
UpdateAsyncWW! ,
(WW, -
idXX 
,XX 
dtoYY 
)YY 
;YY 
return[[ 
	NoContent[[ 
([[ 
)[[ 
;[[ 
}\\ 	
[^^ 	
HttpGet^^	 
(^^ 
$str^^ (
)^^( )
]^^) *
public__ 
async__ 
Task__ 
<__ 
IActionResult__ '
>__' (
GetAvailability`` 
(`` 
intaa 
idaa 
,aa 
[bb 
	FromQuerybb 
]bb 
DateOnlybb $
datebb% )
)bb) *
{cc 	
vardd 
slotsdd 
=dd 
awaitee 
_doctorServiceee $
.ff  
GetAvailabilityAsyncff )
(ff) *
idgg 
,gg 
datehh 
)hh 
;hh 
returnjj 
Okjj 
(jj 
slotsjj 
)jj 
;jj 
}kk 	
[mm 	
HttpPutmm	 
(mm 
$strmm $
)mm$ %
]mm% &
[nn 	
	Authorizenn	 
(nn 
Rolesnn 
=nn 
$strnn "
)nn" #
]nn# $
publicoo 
asyncoo 
Taskoo 
<oo 
IActionResultoo '
>oo' (
Activateoo) 1
(oo1 2
intpp 
idpp 
)pp 
{qq 	
awaitrr 
_doctorServicerr  
.rr  !
ActivateAsyncrr! .
(rr. /
idrr/ 1
)rr1 2
;rr2 3
returntt 
	NoContenttt 
(tt 
)tt 
;tt 
}uu 	
[ww 	
HttpGetww	 
(ww 
$strww $
)ww$ %
]ww% &
[xx 	
	Authorizexx	 
(xx 
Rolesxx 
=xx 
$strxx )
)xx) *
]xx* +
publicyy 
asyncyy 
Taskyy 
<yy 
IActionResultyy '
>yy' (
GetDoctorPatientsyy) :
(yy: ;
intyy; >
idyy? A
)yyA B
{zz 	
try{{ 
{|| 
if}} 
(}} 
User}} 
.}} 
IsInRole}} !
(}}! "
$str}}" *
)}}* +
)}}+ ,
{~~ 
var 
doctorIdFromToken )
=* +#
GetReferenceIdFromToken, C
(C D
)D E
;E F
if
ÅÅ 
(
ÅÅ 
!
ÅÅ 
doctorIdFromToken
ÅÅ *
.
ÅÅ* +
HasValue
ÅÅ+ 3
||
ÅÅ4 6
doctorIdFromToken
ÇÇ )
.
ÇÇ) *
Value
ÇÇ* /
!=
ÇÇ0 2
id
ÇÇ3 5
)
ÇÇ5 6
{
ÉÉ 
return
ÑÑ 
Forbid
ÑÑ %
(
ÑÑ% &
)
ÑÑ& '
;
ÑÑ' (
}
ÖÖ 
}
ÜÜ 
var
àà 
patients
àà 
=
àà 
await
ââ !
_appointmentService
ââ -
.
ââ- .$
GetDoctorPatientsAsync
ââ. D
(
ââD E
id
ââE G
)
ââG H
;
ââH I
return
ãã 
Ok
ãã 
(
ãã 
patients
ãã "
)
ãã" #
;
ãã# $
}
åå 
catch
çç 
(
çç "
KeyNotFoundException
çç '
ex
çç( *
)
çç* +
{
éé 
return
èè 
NotFound
èè 
(
èè  
ex
èè  "
.
èè" #
Message
èè# *
)
èè* +
;
èè+ ,
}
êê 
}
ëë 	
[
ìì 	
HttpPut
ìì	 
(
ìì 
$str
ìì &
)
ìì& '
]
ìì' (
[
îî 	
	Authorize
îî	 
(
îî 
Roles
îî 
=
îî 
$str
îî "
)
îî" #
]
îî# $
public
ïï 
async
ïï 
Task
ïï 
<
ïï 
IActionResult
ïï '
>
ïï' (

Deactivate
ïï) 3
(
ïï3 4
int
ññ 
id
ññ 
)
ññ 
{
óó 	
await
òò 
_doctorService
òò  
.
òò  !
DeactivateAsync
òò! 0
(
òò0 1
id
òò1 3
)
òò3 4
;
òò4 5
return
öö 
	NoContent
öö 
(
öö 
)
öö 
;
öö 
}
õõ 	
private
úú 
int
úú 
?
úú %
GetReferenceIdFromToken
úú ,
(
úú, -
)
úú- .
{
ùù 	
var
ûû 
referenceIdValue
ûû  
=
ûû! "
User
üü 
.
üü 
	FindFirst
üü 
(
üü 
$str
üü ,
)
üü, -
?
üü- .
.
üü. /
Value
üü/ 4
;
üü4 5
if
°° 
(
°° 
int
°° 
.
°° 
TryParse
°° 
(
°° 
referenceIdValue
°° -
,
°°- .
out
°°/ 2
var
°°3 6
referenceId
°°7 B
)
°°B C
)
°°C D
{
¢¢ 
return
££ 
referenceId
££ "
;
££" #
}
§§ 
return
¶¶ 
null
¶¶ 
;
¶¶ 
}
ßß 	
}
©© 
}´´ ‘4
\C:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Controllers\AuthController.cs
	namespace 	
S4_HealthAxisApi
 
. 
Controllers &
{		 
[

 
Route

 

(


 
$str

 
)

 
]

 
[ 
ApiController 
] 
public 

class 
AuthController 
:  !
ControllerBase" 0
{ 
private 
readonly 
IAuthService %
_authService& 2
;2 3
public 
AuthController 
( 
IAuthService *
authService+ 6
)6 7
{ 	
_authService 
= 
authService &
;& '
} 	
[ 	
HttpPost	 
( 
$str 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (
Register) 1
(1 2
RegisterDto2 =
dto> A
)A B
{ 	
var 
result 
= 
await 
_authService +
.+ ,
RegisterAsync, 9
(9 :
dto: =
)= >
;> ?
if 
( 
! 
result 
. 
Success 
)  
{ 
return 

BadRequest !
(! "
result" (
.( )
Message) 0
)0 1
;1 2
} 
return 
Ok 
( 
result 
. 
Data !
)! "
;" #
}   	
["" 	
HttpPost""	 
("" 
$str"" $
)""$ %
]""% &
public## 
async## 
Task## 
<## 
IActionResult## '
>##' (
RegisterPatient##) 8
(##8 9
RegisterPatientDto##9 K
dto##L O
)##O P
{$$ 	
var%% 
result%% 
=%% 
await&& 
_authService&& "
.&&" # 
RegisterPatientAsync&&# 7
(&&7 8
dto&&8 ;
)&&; <
;&&< =
if(( 
((( 
!(( 
result(( 
.(( 
Success(( 
)((  
{)) 
return** 

BadRequest** !
(**! "
result**" (
.**( )
Message**) 0
)**0 1
;**1 2
}++ 
return-- 
Ok-- 
(-- 
result-- 
.-- 
Data-- !
)--! "
;--" #
}.. 	
[00 	
HttpPost00	 
(00 
$str00 
)00 
]00 
public11 
async11 
Task11 
<11 
IActionResult11 '
>11' (
Login11) .
(11. /
LoginDto11/ 7
dto118 ;
)11; <
{22 	
var33 
result33 
=33 
await33 
_authService33 +
.33+ ,

LoginAsync33, 6
(336 7
dto337 :
)33: ;
;33; <
if55 
(55 
!55 
result55 
.55 
Success55 
)55  
{66 
return77 
Unauthorized77 #
(77# $
result77$ *
.77* +
Message77+ 2
)772 3
;773 4
}88 
return:: 
Ok:: 
(:: 
result:: 
.:: 
Data:: !
)::! "
;::" #
};; 	
[== 	
HttpPut==	 
(== 
$str== "
)==" #
]==# $
[>> 	
	Authorize>>	 
]>> 
public?? 
async?? 
Task?? 
<?? 
IActionResult?? '
>??' (
ChangePassword??) 7
(??7 8
[@@ 
FromBody@@ 
]@@ 
ChangePasswordDto@@  
request@@! (
)@@( )
{AA 	
varBB 
emailBB 
=BB 
UserCC 
.CC 
	FindFirstCC 
(CC #
JwtRegisteredClaimNamesCC 6
.CC6 7
EmailCC7 <
)CC< =
?CC= >
.CC> ?
ValueCC? D
??CCE G
UserDD 
.DD 
	FindFirstDD 
(DD 

ClaimTypesDD )
.DD) *
EmailDD* /
)DD/ 0
?DD0 1
.DD1 2
ValueDD2 7
;DD7 8
ifFF 
(FF 
stringFF 
.FF 
IsNullOrWhiteSpaceFF )
(FF) *
emailFF* /
)FF/ 0
)FF0 1
{GG 
returnHH 
UnauthorizedHH #
(HH# $
$strHH$ L
)HHL M
;HHM N
}II 
varKK 
resultKK 
=KK 
awaitLL 
_authServiceLL "
.LL" #
ChangePasswordAsyncLL# 6
(LL6 7
emailLL7 <
,LL< =
requestLL> E
)LLE F
;LLF G
ifNN 
(NN 
!NN 
resultNN 
.NN 
SuccessNN 
)NN  
{OO 
returnPP 

BadRequestPP !
(PP! "
resultPP" (
.PP( )
MessagePP) 0
)PP0 1
;PP1 2
}QQ 
returnSS 
OkSS 
(SS 
newSS 
{TT 
messageUU 
=UU 
resultUU  
.UU  !
MessageUU! (
}VV 
)VV 
;VV 
}WW 	
[YY 	
HttpPostYY	 
(YY 
$strYY !
)YY! "
]YY" #
publicZZ 
asyncZZ 
TaskZZ 
<ZZ 
IActionResultZZ '
>ZZ' (
RefreshTokenZZ) 5
(ZZ5 6
RefreshTokenDtoZZ6 E
dtoZZF I
)ZZI J
{[[ 	
var\\ 
result\\ 
=\\ 
await]] 
_authService]] "
.]]" #
RefreshTokenAsync]]# 4
(]]4 5
dto]]5 8
)]]8 9
;]]9 :
if__ 
(__ 
!__ 
result__ 
.__ 
Success__ 
)__  
{`` 
returnaa 
Unauthorizedaa #
(aa# $
resultaa$ *
.aa* +
Messageaa+ 2
)aa2 3
;aa3 4
}bb 
returndd 
Okdd 
(dd 
resultdd 
.dd 
Datadd !
)dd! "
;dd" #
}ee 	
}ii 
}jj ¨ø
cC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Controllers\AppointmentController.cs
	namespace 	
S4_HealthAxisApi
 
. 
Controllers &
{ 
[		 
Route		 

(		
 
$str		 
)		 
]		 
[

 
ApiController

 
]

 
[ 
	Authorize 
] 
public 

class "
AppointmentsController '
:( )
ControllerBase* 8
{ 
private 
readonly 
IAppointmentService ,
_appointmentService- @
;@ A
public "
AppointmentsController %
(% &
IAppointmentService 
appointmentService  2
)2 3
{ 	
_appointmentService 
=  !
appointmentService" 4
;4 5
} 	
[ 	
HttpGet	 
] 
[ 	
	Authorize	 
( 
Roles 
= 
$str "
)" #
]# $
public 
async 
Task 
< 
ActionResult &
<& '
IEnumerable' 2
<2 3!
AppointmentDetailsDto3 H
>H I
>I J
>J K
GetAllL R
(R S
)S T
{ 	
var 
appointments 
= 
await $
_appointmentService% 8
.8 9
GetAllAsync9 D
(D E
)E F
;F G
return 
Ok 
( 
appointments "
)" #
;# $
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public   
async   
Task   
<   
IActionResult   '
>  ' (
GetById  ) 0
(  0 1
int  1 4
id  5 7
)  7 8
{!! 	
var"" 
appointment"" 
="" 
await## 
_appointmentService## )
.##) *
GetByIdAsync##* 6
(##6 7
id##7 9
)##9 :
;##: ;
if%% 
(%% 
appointment%% 
==%% 
null%% #
)%%# $
{&& 
return'' 
NotFound'' 
(''  
$"''  "
$str''" .
{''. /
id''/ 1
}''1 2
$str''2 =
"''= >
)''> ?
;''? @
}(( 
if** 
(** 
User** 
.** 
IsInRole** 
(** 
$str** '
)**' (
)**( )
{++ 
var,, 
patientIdFromToken,, &
=,,' (*
GetPatientReferenceIdFromToken,,) G
(,,G H
),,H I
;,,I J
if.. 
(.. 
!.. 
patientIdFromToken.. '
...' (
HasValue..( 0
||..1 3
appointment// 
.//  
	PatientId//  )
!=//* ,
patientIdFromToken//- ?
.//? @
Value//@ E
)//E F
{00 
return11 
Forbid11 !
(11! "
)11" #
;11# $
}22 
}33 
return55 
Ok55 
(55 
appointment55 !
)55! "
;55" #
}66 	
[88 	
HttpGet88	 
(88 
$str88 *
)88* +
]88+ ,
[99 	
	Authorize99	 
(99 
Roles99 
=99 
$str99 1
)991 2
]992 3
public:: 
async:: 
Task:: 
<:: 
IActionResult:: '
>::' (
GetPatientHistory::) :
(::: ;
int;; 
	patientId;; 
);; 
{<< 	
if== 
(== 
User== 
.== 
IsInRole== 
(== 
$str== '
)==' (
)==( )
{>> 
var?? 
patientIdFromToken?? &
=??' (*
GetPatientReferenceIdFromToken??) G
(??G H
)??H I
;??I J
ifAA 
(AA 
!AA 
patientIdFromTokenAA '
.AA' (
HasValueAA( 0
||AA1 3
patientIdFromTokenBB &
.BB& '
ValueBB' ,
!=BB- /
	patientIdBB0 9
)BB9 :
{CC 
returnDD 
ForbidDD !
(DD! "
)DD" #
;DD# $
}EE 
}FF 
varHH 
appointmentsHH 
=HH 
awaitII 
_appointmentServiceII )
.JJ "
GetPatientHistoryAsyncJJ +
(JJ+ ,
	patientIdJJ, 5
)JJ5 6
;JJ6 7
returnLL 
OkLL 
(LL 
appointmentsLL "
)LL" #
;LL# $
}MM 	
[OO 	
HttpGetOO	 
(OO 
$strOO .
)OO. /
]OO/ 0
[PP 	
	AuthorizePP	 
(PP 
RolesPP 
=PP 
$strPP )
)PP) *
]PP* +
publicQQ 
asyncQQ 
TaskQQ 
<QQ 
IActionResultQQ '
>QQ' ("
GetDoctorTodayScheduleQQ) ?
(QQ? @
intRR 
doctorIdRR 
)RR 
{SS 	
varTT 
scheduleTT 
=TT 
awaitUU 
_appointmentServiceUU )
.VV '
GetDoctorTodayScheduleAsyncVV 0
(VV0 1
doctorIdVV1 9
)VV9 :
;VV: ;
returnXX 
OkXX 
(XX 
scheduleXX 
)XX 
;XX  
}YY 	
[[[ 	
HttpGet[[	 
([[ 
$str[[ -
)[[- .
][[. /
[\\ 	
	Authorize\\	 
(\\ 
Roles\\ 
=\\ 
$str\\ )
)\\) *
]\\* +
public]] 
async]] 
Task]] 
<]] 
IActionResult]] '
>]]' (!
GetDoctorWeekSchedule]]) >
(]]> ?
int^^ 
doctorId^^ 
,^^ 
[__ 
	FromQuery__ 
]__ 
DateOnly__  
	startDate__! *
,__* +
[`` 
	FromQuery`` 
]`` 
DateOnly``  
endDate``! (
)``( )
{aa 	
varbb 
schedulebb 
=bb 
awaitcc 
_appointmentServicecc )
.dd &
GetDoctorWeekScheduleAsyncdd /
(dd/ 0
doctorIdee  
,ee  !
	startDateff !
,ff! "
endDategg 
)gg  
;gg  !
returnii 
Okii 
(ii 
scheduleii 
)ii 
;ii  
}jj 	
[ll 	
HttpGetll	 
(ll 
$strll 1
)ll1 2
]ll2 3
[mm 	
	Authorizemm	 
(mm 
Rolesmm 
=mm 
$strmm )
)mm) *
]mm* +
publicnn 
asyncnn 
Tasknn 
<nn 
IActionResultnn '
>nn' (%
GetDoctorUpcomingSchedulenn) B
(nnB C
intnnC F
doctorIdnnG O
)nnO P
{oo 	
varpp 
resultpp 
=pp 
awaitqq 
_appointmentServiceqq )
.rr *
GetDoctorUpcomingScheduleAsyncrr 3
(rr3 4
doctorIdss  
)ss  !
;ss! "
returnuu 
Okuu 
(uu 
resultuu 
)uu 
;uu 
}vv 	
[xx 	
HttpPostxx	 
]xx 
[yy 	
	Authorizeyy	 
(yy 
Rolesyy 
=yy 
$stryy *
)yy* +
]yy+ ,
publiczz 
asynczz 
Taskzz 
<zz 
IActionResultzz '
>zz' (
Createzz) /
(zz/ 0
[{{ 
FromBody{{ 
]{{  
CreateAppointmentDto{{ +
dto{{, /
){{/ 0
{|| 	
try}} 
{~~ 
if 
( 
User 
. 
IsInRole !
(! "
$str" +
)+ ,
), -
{
ÄÄ 
var
ÅÅ  
patientIdFromToken
ÅÅ *
=
ÅÅ+ ,,
GetPatientReferenceIdFromToken
ÅÅ- K
(
ÅÅK L
)
ÅÅL M
;
ÅÅM N
if
ÉÉ 
(
ÉÉ 
!
ÉÉ  
patientIdFromToken
ÉÉ +
.
ÉÉ+ ,
HasValue
ÉÉ, 4
||
ÉÉ5 7
dto
ÑÑ 
.
ÑÑ 
	PatientId
ÑÑ %
!=
ÑÑ& ( 
patientIdFromToken
ÑÑ) ;
.
ÑÑ; <
Value
ÑÑ< A
)
ÑÑA B
{
ÖÖ 
return
ÜÜ 
Forbid
ÜÜ %
(
ÜÜ% &
)
ÜÜ& '
;
ÜÜ' (
}
áá 
}
àà 
var
ää 
appointment
ää 
=
ää  !
await
ãã !
_appointmentService
ãã -
.
ãã- .
CreateAsync
ãã. 9
(
ãã9 :
dto
ãã: =
)
ãã= >
;
ãã> ?
return
çç 
CreatedAtAction
çç &
(
çç& '
nameof
éé 
(
éé 
GetById
éé "
)
éé" #
,
éé# $
new
èè 
{
èè 
id
èè 
=
èè 
appointment
èè *
.
èè* +
AppointmentId
èè+ 8
}
èè9 :
,
èè: ;
appointment
êê 
)
êê  
;
êê  !
}
ëë 
catch
íí 
(
íí 
ArgumentException
íí $
ex
íí% '
)
íí' (
{
ìì 
return
îî 

BadRequest
îî !
(
îî! "
ex
îî" $
.
îî$ %
Message
îî% ,
)
îî, -
;
îî- .
}
ïï 
catch
ññ 
(
ññ '
InvalidOperationException
ññ ,
ex
ññ- /
)
ññ/ 0
{
óó 
return
òò 

BadRequest
òò !
(
òò! "
ex
òò" $
.
òò$ %
Message
òò% ,
)
òò, -
;
òò- .
}
ôô 
catch
öö 
(
öö "
KeyNotFoundException
öö '
ex
öö( *
)
öö* +
{
õõ 
return
úú 
NotFound
úú 
(
úú  
ex
úú  "
.
úú" #
Message
úú# *
)
úú* +
;
úú+ ,
}
ùù 
}
ûû 	
[
†† 	
HttpPut
††	 
(
†† 
$str
†† 
)
†† 
]
†† 
[
°° 	
	Authorize
°°	 
(
°° 
Roles
°° 
=
°° 
$str
°° *
)
°°* +
]
°°+ ,
public
¢¢ 
async
¢¢ 
Task
¢¢ 
<
¢¢ 
IActionResult
¢¢ '
>
¢¢' (
Update
¢¢) /
(
¢¢/ 0
int
££ 
id
££ 
,
££ 
[
§§ 
FromBody
§§ 
]
§§ "
UpdateAppointmentDto
§§ +
dto
§§, /
)
§§/ 0
{
•• 	
try
¶¶ 
{
ßß 
var
®® !
existingAppointment
®® '
=
®®( )
await
©© !
_appointmentService
©© -
.
©©- .
GetByIdAsync
©©. :
(
©©: ;
id
©©; =
)
©©= >
;
©©> ?
if
´´ 
(
´´ !
existingAppointment
´´ '
==
´´( *
null
´´+ /
)
´´/ 0
{
¨¨ 
return
≠≠ 
NotFound
≠≠ #
(
≠≠# $
$"
≠≠$ &
$str
≠≠& 2
{
≠≠2 3
id
≠≠3 5
}
≠≠5 6
$str
≠≠6 A
"
≠≠A B
)
≠≠B C
;
≠≠C D
}
ÆÆ 
if
∞∞ 
(
∞∞ 
User
∞∞ 
.
∞∞ 
IsInRole
∞∞ !
(
∞∞! "
$str
∞∞" +
)
∞∞+ ,
)
∞∞, -
{
±± 
var
≤≤  
patientIdFromToken
≤≤ *
=
≤≤+ ,,
GetPatientReferenceIdFromToken
≤≤- K
(
≤≤K L
)
≤≤L M
;
≤≤M N
if
¥¥ 
(
¥¥ 
!
¥¥  
patientIdFromToken
¥¥ +
.
¥¥+ ,
HasValue
¥¥, 4
||
¥¥5 7!
existingAppointment
µµ +
.
µµ+ ,
	PatientId
µµ, 5
!=
µµ6 8 
patientIdFromToken
µµ9 K
.
µµK L
Value
µµL Q
)
µµQ R
{
∂∂ 
return
∑∑ 
Forbid
∑∑ %
(
∑∑% &
)
∑∑& '
;
∑∑' (
}
∏∏ 
}
ππ 
await
ªª !
_appointmentService
ªª )
.
ºº 
UpdateAsync
ºº  
(
ºº  !
id
ºº! #
,
ºº# $
dto
ºº% (
)
ºº( )
;
ºº) *
return
ææ 
	NoContent
ææ  
(
ææ  !
)
ææ! "
;
ææ" #
}
øø 
catch
¿¿ 
(
¿¿ "
KeyNotFoundException
¿¿ '
ex
¿¿( *
)
¿¿* +
{
¡¡ 
return
¬¬ 
NotFound
¬¬ 
(
¬¬  
ex
¬¬  "
.
¬¬" #
Message
¬¬# *
)
¬¬* +
;
¬¬+ ,
}
√√ 
catch
ƒƒ 
(
ƒƒ 
ArgumentException
ƒƒ $
ex
ƒƒ% '
)
ƒƒ' (
{
≈≈ 
return
∆∆ 

BadRequest
∆∆ !
(
∆∆! "
ex
∆∆" $
.
∆∆$ %
Message
∆∆% ,
)
∆∆, -
;
∆∆- .
}
«« 
catch
»» 
(
»» '
InvalidOperationException
»» ,
ex
»»- /
)
»»/ 0
{
…… 
return
   

BadRequest
   !
(
  ! "
ex
  " $
.
  $ %
Message
  % ,
)
  , -
;
  - .
}
ÀÀ 
}
ÃÃ 	
[
ŒŒ 	
HttpPut
ŒŒ	 
(
ŒŒ 
$str
ŒŒ #
)
ŒŒ# $
]
ŒŒ$ %
[
œœ 	
	Authorize
œœ	 
(
œœ 
Roles
œœ 
=
œœ 
$str
œœ )
)
œœ) *
]
œœ* +
public
–– 
async
–– 
Task
–– 
<
–– 
IActionResult
–– '
>
––' (
Confirm
––) 0
(
––0 1
int
––1 4
id
––5 7
)
––7 8
{
—— 	
try
““ 
{
”” 
await
‘‘ !
_appointmentService
‘‘ )
.
’’ 
ConfirmAsync
’’ !
(
’’! "
id
’’" $
)
’’$ %
;
’’% &
return
◊◊ 
	NoContent
◊◊  
(
◊◊  !
)
◊◊! "
;
◊◊" #
}
ÿÿ 
catch
ŸŸ 
(
ŸŸ "
KeyNotFoundException
ŸŸ '
)
ŸŸ' (
{
⁄⁄ 
return
€€ 
NotFound
€€ 
(
€€  
)
€€  !
;
€€! "
}
‹‹ 
catch
›› 
(
›› '
InvalidOperationException
›› ,
ex
››- /
)
››/ 0
{
ﬁﬁ 
return
ﬂﬂ 

BadRequest
ﬂﬂ !
(
ﬂﬂ! "
ex
ﬂﬂ" $
.
ﬂﬂ$ %
Message
ﬂﬂ% ,
)
ﬂﬂ, -
;
ﬂﬂ- .
}
‡‡ 
}
·· 	
[
„„ 	
HttpPut
„„	 
(
„„ 
$str
„„ $
)
„„$ %
]
„„% &
[
‰‰ 	
	Authorize
‰‰	 
(
‰‰ 
Roles
‰‰ 
=
‰‰ 
$str
‰‰ )
)
‰‰) *
]
‰‰* +
public
ÂÂ 
async
ÂÂ 
Task
ÂÂ 
<
ÂÂ 
IActionResult
ÂÂ '
>
ÂÂ' (
Complete
ÂÂ) 1
(
ÂÂ1 2
int
ÂÂ2 5
id
ÂÂ6 8
)
ÂÂ8 9
{
ÊÊ 	
try
ÁÁ 
{
ËË 
await
ÈÈ !
_appointmentService
ÈÈ )
.
ÍÍ 
CompleteAsync
ÍÍ "
(
ÍÍ" #
id
ÍÍ# %
)
ÍÍ% &
;
ÍÍ& '
return
ÏÏ 
	NoContent
ÏÏ  
(
ÏÏ  !
)
ÏÏ! "
;
ÏÏ" #
}
ÌÌ 
catch
ÓÓ 
(
ÓÓ "
KeyNotFoundException
ÓÓ '
)
ÓÓ' (
{
ÔÔ 
return
 
NotFound
 
(
  
)
  !
;
! "
}
ÒÒ 
catch
ÚÚ 
(
ÚÚ '
InvalidOperationException
ÚÚ ,
ex
ÚÚ- /
)
ÚÚ/ 0
{
ÛÛ 
return
ÙÙ 

BadRequest
ÙÙ !
(
ÙÙ! "
ex
ÙÙ" $
.
ÙÙ$ %
Message
ÙÙ% ,
)
ÙÙ, -
;
ÙÙ- .
}
ıı 
}
ˆˆ 	
[
¯¯ 	
HttpPut
¯¯	 
(
¯¯ 
$str
¯¯ "
)
¯¯" #
]
¯¯# $
[
˘˘ 	
	Authorize
˘˘	 
]
˘˘ 
public
˙˙ 
async
˙˙ 
Task
˙˙ 
<
˙˙ 
IActionResult
˙˙ '
>
˙˙' (
UpdateStatus
˙˙) 5
(
˙˙5 6
int
˚˚ 
id
˚˚ 
,
˚˚ 
[
¸¸ 
FromBody
¸¸ 
]
¸¸ (
UpdateAppointmentStatusDto
¸¸ 1
dto
¸¸2 5
)
¸¸5 6
{
˝˝ 	
var
˛˛ !
existingAppointment
˛˛ #
=
˛˛$ %
await
ˇˇ !
_appointmentService
ˇˇ )
.
ˇˇ) *
GetByIdAsync
ˇˇ* 6
(
ˇˇ6 7
id
ˇˇ7 9
)
ˇˇ9 :
;
ˇˇ: ;
if
ÅÅ 
(
ÅÅ !
existingAppointment
ÅÅ #
==
ÅÅ$ &
null
ÅÅ' +
)
ÅÅ+ ,
{
ÇÇ 
return
ÉÉ 
NotFound
ÉÉ 
(
ÉÉ  
$"
ÉÉ  "
$str
ÉÉ" .
{
ÉÉ. /
id
ÉÉ/ 1
}
ÉÉ1 2
$str
ÉÉ2 =
"
ÉÉ= >
)
ÉÉ> ?
;
ÉÉ? @
}
ÑÑ 
if
ÜÜ 
(
ÜÜ 
User
ÜÜ 
.
ÜÜ 
IsInRole
ÜÜ 
(
ÜÜ 
$str
ÜÜ '
)
ÜÜ' (
)
ÜÜ( )
{
áá 
var
àà  
patientIdFromToken
àà &
=
àà' (,
GetPatientReferenceIdFromToken
àà) G
(
ààG H
)
ààH I
;
ààI J
if
ää 
(
ää 
!
ää  
patientIdFromToken
ää '
.
ää' (
HasValue
ää( 0
||
ää1 3!
existingAppointment
ãã '
.
ãã' (
	PatientId
ãã( 1
!=
ãã2 4 
patientIdFromToken
ãã5 G
.
ããG H
Value
ããH M
)
ããM N
{
åå 
return
çç 
Forbid
çç !
(
çç! "
)
çç" #
;
çç# $
}
éé 
}
èè 
await
ëë !
_appointmentService
ëë %
.
íí 
UpdateStatusAsync
íí "
(
íí" #
id
íí# %
,
íí% &
dto
íí' *
)
íí* +
;
íí+ ,
return
îî 
	NoContent
îî 
(
îî 
)
îî 
;
îî 
}
ïï 	
[
óó 	
HttpPut
óó	 
(
óó 
$str
óó "
)
óó" #
]
óó# $
[
òò 	
	Authorize
òò	 
(
òò 
Roles
òò 
=
òò 
$str
òò 1
)
òò1 2
]
òò2 3
public
ôô 
async
ôô 
Task
ôô 
<
ôô 
IActionResult
ôô '
>
ôô' (
Cancel
ôô) /
(
ôô/ 0
int
öö 
id
öö 
,
öö 
[
õõ 
FromBody
õõ 
]
õõ "
CancelAppointmentDto
õõ +
dto
õõ, /
)
õõ/ 0
{
úú 	
try
ùù 
{
ûû 
var
üü !
existingAppointment
üü '
=
üü( )
await
†† !
_appointmentService
†† -
.
††- .
GetByIdAsync
††. :
(
††: ;
id
††; =
)
††= >
;
††> ?
if
¢¢ 
(
¢¢ !
existingAppointment
¢¢ '
==
¢¢( *
null
¢¢+ /
)
¢¢/ 0
{
££ 
return
§§ 
NotFound
§§ #
(
§§# $
$"
§§$ &
$str
§§& 2
{
§§2 3
id
§§3 5
}
§§5 6
$str
§§6 A
"
§§A B
)
§§B C
;
§§C D
}
•• 
if
ßß 
(
ßß 
User
ßß 
.
ßß 
IsInRole
ßß !
(
ßß! "
$str
ßß" +
)
ßß+ ,
)
ßß, -
{
®® 
var
©©  
patientIdFromToken
©© *
=
©©+ ,,
GetPatientReferenceIdFromToken
©©- K
(
©©K L
)
©©L M
;
©©M N
if
´´ 
(
´´ 
!
´´  
patientIdFromToken
´´ +
.
´´+ ,
HasValue
´´, 4
||
´´5 7!
existingAppointment
¨¨ +
.
¨¨+ ,
	PatientId
¨¨, 5
!=
¨¨6 8 
patientIdFromToken
¨¨9 K
.
¨¨K L
Value
¨¨L Q
)
¨¨Q R
{
≠≠ 
return
ÆÆ 
Forbid
ÆÆ %
(
ÆÆ% &
)
ÆÆ& '
;
ÆÆ' (
}
ØØ 
dto
±± 
.
±±  
CancellationReason
±± *
=
±±+ ,
$"
≤≤ 
$str
≤≤ 0
{
≤≤0 1
dto
≤≤1 4
.
≤≤4 5 
CancellationReason
≤≤5 G
}
≤≤G H
"
≤≤H I
;
≤≤I J
}
≥≥ 
if
µµ 
(
µµ 
User
µµ 
.
µµ 
IsInRole
µµ !
(
µµ! "
$str
µµ" *
)
µµ* +
)
µµ+ ,
{
∂∂ 
var
∑∑ 
doctorIdFromToken
∑∑ )
=
∑∑* +,
GetPatientReferenceIdFromToken
∑∑, J
(
∑∑J K
)
∑∑K L
;
∑∑L M
if
ππ 
(
ππ 
!
ππ 
doctorIdFromToken
ππ *
.
ππ* +
HasValue
ππ+ 3
||
ππ4 6!
existingAppointment
∫∫ +
.
∫∫+ ,
DoctorId
∫∫, 4
!=
∫∫5 7
doctorIdFromToken
∫∫8 I
.
∫∫I J
Value
∫∫J O
)
∫∫O P
{
ªª 
return
ºº 
Forbid
ºº %
(
ºº% &
)
ºº& '
;
ºº' (
}
ΩΩ 
dto
øø 
.
øø  
CancellationReason
øø *
=
øø+ ,
$"
¿¿ 
$str
¿¿ /
{
¿¿/ 0
dto
¿¿0 3
.
¿¿3 4 
CancellationReason
¿¿4 F
}
¿¿F G
"
¿¿G H
;
¿¿H I
}
¡¡ 
await
√√ !
_appointmentService
√√ )
.
√√) *
CancelAsync
√√* 5
(
√√5 6
id
√√6 8
,
√√8 9
dto
√√: =
)
√√= >
;
√√> ?
return
≈≈ 
	NoContent
≈≈  
(
≈≈  !
)
≈≈! "
;
≈≈" #
}
∆∆ 
catch
«« 
(
«« "
KeyNotFoundException
«« '
)
««' (
{
»» 
return
…… 
NotFound
…… 
(
……  
)
……  !
;
……! "
}
   
catch
ÀÀ 
(
ÀÀ 
ArgumentException
ÀÀ $
ex
ÀÀ% '
)
ÀÀ' (
{
ÃÃ 
return
ÕÕ 

BadRequest
ÕÕ !
(
ÕÕ! "
ex
ÕÕ" $
.
ÕÕ$ %
Message
ÕÕ% ,
)
ÕÕ, -
;
ÕÕ- .
}
ŒŒ 
catch
œœ 
(
œœ '
InvalidOperationException
œœ ,
ex
œœ- /
)
œœ/ 0
{
–– 
return
—— 

BadRequest
—— !
(
——! "
ex
——" $
.
——$ %
Message
——% ,
)
——, -
;
——- .
}
““ 
}
”” 	
private
’’ 
int
’’ 
?
’’ ,
GetPatientReferenceIdFromToken
’’ 3
(
’’3 4
)
’’4 5
{
÷÷ 	
var
◊◊ 
referenceIdValue
◊◊  
=
◊◊! "
User
◊◊# '
.
◊◊' (
	FindFirst
◊◊( 1
(
◊◊1 2
$str
◊◊2 ?
)
◊◊? @
?
◊◊@ A
.
◊◊A B
Value
◊◊B G
;
◊◊G H
if
ŸŸ 
(
ŸŸ 
int
ŸŸ 
.
ŸŸ 
TryParse
ŸŸ 
(
ŸŸ 
referenceIdValue
ŸŸ -
,
ŸŸ- .
out
ŸŸ/ 2
var
ŸŸ3 6
referenceId
ŸŸ7 B
)
ŸŸB C
)
ŸŸC D
{
⁄⁄ 
return
€€ 
referenceId
€€ "
;
€€" #
}
‹‹ 
return
ﬁﬁ 
null
ﬁﬁ 
;
ﬁﬁ 
}
ﬂﬂ 	
}
‡‡ 
}·· 
]C:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Controllers\AdminController.cs
	namespace 	
S4_HealthAxisApi
 
. 
Controllers &
{ 
[		 
	Authorize		 
(		 
Roles		 
=		 
$str		 
)		 
]		  
[

 
Route

 

(


 
$str

 
)

 
]

 
[ 
ApiController 
] 
public 

class 
AdminController  
:! "
ControllerBase# 1
{ 
private 
readonly 
IAdminService &
_adminService' 4
;4 5
public 
AdminController 
( 
IAdminService 
adminService &
)& '
{ 	
_adminService 
= 
adminService (
;( )
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (
GetDashboard 
( 
) 
{ 	
return 
Ok 
( 
await 
_adminService #
. 
GetDashboardAsync &
(& '
)' (
)( )
;) *
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public   
async   
Task   
<   
IActionResult   '
>  ' (
GetStatistics!! 
(!! 
)!! 
{"" 	
return## 
Ok## 
(## 
await$$ 
_adminService$$ #
.%% 
GetStatisticsAsync%% '
(%%' (
)%%( )
)%%) *
;%%* +
}&& 	
[(( 	
HttpGet((	 
((( 
$str(( 
)(( 
](( 
public)) 
async)) 
Task)) 
<)) 
IActionResult)) '
>))' (
GetUsers** 
(** 
)** 
{++ 	
return,, 
Ok,, 
(,, 
await-- 
_adminService-- #
... 
GetUsersAsync.. "
(.." #
)..# $
)..$ %
;..% &
}// 	
[11 	
HttpGet11	 
(11 
$str11 
)11 
]11 
public22 
async22 
Task22 
<22 
IActionResult22 '
>22' (
GetUser33 
(33 
int33 
id33 
)33 
{44 	
var55 
user55 
=55 
await66 
_adminService66 #
.77 
GetUserByIdAsync77 %
(77% &
id77& (
)77( )
;77) *
if99 
(99 
user99 
==99 
null99 
)99 
return:: 
NotFound:: 
(::  
)::  !
;::! "
return<< 
Ok<< 
(<< 
user<< 
)<< 
;<< 
}== 	
}>> 
}?? Â
eC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Consumers\AppointmentBookedConsumer.cs
	namespace 	
S4_HealthAxisApi
 
. 
	Consumers $
{ 
public 

class %
AppointmentBookedConsumer *
:+ ,
	IConsumer 
< "
AppointmentBookedEvent (
>( )
{ 
private		 
readonly		 
ILogger		  
<		  !%
AppointmentBookedConsumer		! :
>		: ;
_logger		< C
;		C D
public %
AppointmentBookedConsumer (
(( )
ILogger 
< %
AppointmentBookedConsumer -
>- .
logger/ 5
)5 6
{ 	
_logger 
= 
logger 
; 
} 	
public 
Task 
Consume 
( 
ConsumeContext 
< "
AppointmentBookedEvent 1
>1 2
context3 :
): ;
{ 	
var 
message 
= 
context 
. 
Message 
;  
_logger 
. 
LogInformation "
(" #
$str& 
,&& 
nameof'' 
('' "
AppointmentBookedEvent'' -
)''- .
,''. /
message(( 
.(( 
AppointmentId(( %
,((% &
message)) 
.)) 
PatientName)) #
,))# $
message** 
.** 
DoctorId**  
,**  !
message++ 
.++ 
ScheduledDate++ %
,++% &
message,, 
.,, 
TimeSlot,,  
,,,  !
context-- 
.-- 
	MessageId-- !
?--! "
.--" #
ToString--# +
(--+ ,
)--, -
??--. 0
$str--1 6
)--6 7
;--7 8
return// 
Task// 
.// 
CompletedTask// %
;//% &
}00 	
}11 
}22 ã0
oC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\BackgroundServices\NotificationCleanupService.cs
	namespace 	
S4_HealthAxisApi
 
. 
BackgroundServices -
{ 
public 

sealed 
class &
NotificationCleanupService 2
:3 4
BackgroundService5 F
{ 
private 
static 
readonly 
TimeSpan  (
CleanupInterval) 8
=9 :
TimeSpan; C
.C D
	FromHoursD M
(M N
$numN O
)O P
;P Q
private		 
static		 
readonly		 
TimeSpan		  ('
NotificationRetentionPeriod		) D
=		E F
TimeSpan		G O
.		O P
FromDays		P X
(		X Y
$num		Y [
)		[ \
;		\ ]
private 
readonly 
ILogger  
<  !&
NotificationCleanupService! ;
>; <
_logger= D
;D E
private 
readonly  
IServiceScopeFactory - 
_serviceScopeFactory. B
;B C
public &
NotificationCleanupService )
() *
ILogger 
< &
NotificationCleanupService .
>. /
logger0 6
,6 7 
IServiceScopeFactory  
serviceScopeFactory! 4
)4 5
{ 	
_logger 
= 
logger 
;  
_serviceScopeFactory  
=! "
serviceScopeFactory# 6
;6 7
} 	
	protected 
override 
async  
Task! %
ExecuteAsync& 2
(2 3
CancellationToken3 D
stoppingTokenE R
)R S
{ 	
_logger 
. 
LogInformation "
(" #
$str# H
)H I
;I J
try 
{ 
while 
( 
! 
stoppingToken %
.% &#
IsCancellationRequested& =
)= >
{ 
await '
DeleteOldNotificationsAsync 5
(5 6
stoppingToken6 C
)C D
;D E
await   
Task   
.   
Delay   $
(  $ %
CleanupInterval  % 4
,  4 5
stoppingToken  6 C
)  C D
;  D E
}!! 
}"" 
catch## 
(## &
OperationCanceledException## -
)##- .
when##/ 3
(##4 5
stoppingToken##5 B
.##B C#
IsCancellationRequested##C Z
)##Z [
{$$ 
_logger%% 
.%% 
LogInformation%% &
(%%& '
$str%%' [
)%%[ \
;%%\ ]
}&& 
finally'' 
{(( 
_logger)) 
.)) 
LogInformation)) &
())& '
$str))' L
)))L M
;))M N
}** 
}++ 	
private-- 
async-- 
Task-- '
DeleteOldNotificationsAsync-- 6
(--6 7
CancellationToken--7 H
cancellationToken--I Z
)--Z [
{.. 	
var// 

cutoffDate// 
=// 
DateTime// %
.//% &
UtcNow//& ,
.//, -
Subtract//- 5
(//5 6'
NotificationRetentionPeriod//6 Q
)//Q R
;//R S
using11 
var11 
scope11 
=11  
_serviceScopeFactory11 2
.112 3
CreateScope113 >
(11> ?
)11? @
;11@ A
var33 
	dbContext33 
=33 
scope33 !
.33! "
ServiceProvider33" 1
.331 2
GetRequiredService332 D
<33D E
HealthAxisDbContext33E X
>33X Y
(33Y Z
)33Z [
;33[ \
var55 
oldNotifications55  
=55! "
await55# (
	dbContext55) 2
.552 3
Notifications553 @
.66 
Where66 
(66 
notification66 #
=>66$ &
notification66' 3
.663 4
	CreatedOn664 =
<66> ?

cutoffDate66@ J
)66J K
.77 
ToListAsync77 
(77 
cancellationToken77 .
)77. /
;77/ 0
if99 
(99 
oldNotifications99  
.99  !
Count99! &
==99' )
$num99* +
)99+ ,
{:: 
_logger;; 
.;; 
LogInformation;; &
(;;& '
$str<< y
,<<y z
DateTimeOffset== "
.==" #
Now==# &
,==& '

cutoffDate>> 
)>> 
;>>  
return@@ 
;@@ 
}AA 
	dbContextCC 
.CC 
NotificationsCC #
.CC# $
RemoveRangeCC$ /
(CC/ 0
oldNotificationsCC0 @
)CC@ A
;CCA B
awaitEE 
	dbContextEE 
.EE 
SaveChangesAsyncEE ,
(EE, -
cancellationTokenEE- >
)EE> ?
;EE? @
_loggerGG 
.GG 
LogInformationGG "
(GG" #
$str	HH Ö
,
HHÖ Ü
DateTimeOffsetII 
.II 
NowII "
,II" #
oldNotificationsJJ  
.JJ  !
CountJJ! &
,JJ& '

cutoffDateKK 
)KK 
;KK 
}LL 	
publicNN 
overrideNN 
asyncNN 
TaskNN "
	StopAsyncNN# ,
(NN, -
CancellationTokenNN- >
cancellationTokenNN? P
)NNP Q
{OO 	
_loggerPP 
.PP 
LogInformationPP "
(PP" #
$strPP# \
)PP\ ]
;PP] ^
awaitRR 
baseRR 
.RR 
	StopAsyncRR  
(RR  !
cancellationTokenRR! 2
)RR2 3
;RR3 4
}SS 	
}TT 
}UU £
eC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\BackgroundServices\HeartbeatService.cs
	namespace 	
S4_HealthAxisApi
 
. 
BackgroundServices -
{ 
public 

sealed 
class 
HeartbeatService (
:) *
BackgroundService+ <
{ 
private 
static 
readonly 
TimeSpan  (
HeartbeatInterval) :
=; <
TimeSpan= E
.E F
FromSecondsF Q
(Q R
$numR U
)U V
;V W
private 
readonly 
ILogger  
<  !
HeartbeatService! 1
>1 2
_logger3 :
;: ;
public		 
HeartbeatService		 
(		  
ILogger		  '
<		' (
HeartbeatService		( 8
>		8 9
logger		: @
)		@ A
{

 	
_logger 
= 
logger 
; 
} 	
	protected 
override 
async  
Task! %
ExecuteAsync& 2
(2 3
CancellationToken3 D
stoppingTokenE R
)R S
{ 	
_logger 
. 
LogInformation "
(" #
$str# >
)> ?
;? @
try 
{ 
while 
( 
! 
stoppingToken %
.% &#
IsCancellationRequested& =
)= >
{ 
_logger 
. 
LogInformation *
(* +
$str J
,J K
DateTimeOffset &
.& '
Now' *
)* +
;+ ,
await 
Task 
. 
Delay $
($ %
HeartbeatInterval% 6
,6 7
stoppingToken8 E
)E F
;F G
} 
} 
catch 
( &
OperationCanceledException -
)- .
when/ 3
(4 5
stoppingToken5 B
.B C#
IsCancellationRequestedC Z
)Z [
{ 
_logger 
. 
LogInformation &
(& '
$str' Q
)Q R
;R S
}   
finally!! 
{"" 
_logger## 
.## 
LogInformation## &
(##& '
$str##' B
)##B C
;##C D
}$$ 
}%% 	
public'' 
override'' 
async'' 
Task'' "
	StopAsync''# ,
('', -
CancellationToken''- >
cancellationToken''? P
)''P Q
{(( 	
_logger)) 
.)) 
LogInformation)) "
())" #
$str))# R
)))R S
;))S T
await++ 
base++ 
.++ 
	StopAsync++  
(++  !
cancellationToken++! 2
)++2 3
;++3 4
},, 	
}-- 
}.. …ê
rC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\BackgroundServices\AppointmentMaintenanceService.cs
	namespace 	
S4_HealthAxisApi
 
. 
BackgroundServices -
{ 
public 

sealed 
class )
AppointmentMaintenanceService 5
:6 7
BackgroundService8 I
{		 
private

 
static

 
readonly

 
TimeSpan

  (
MaintenanceInterval

) <
=

= >
TimeSpan 
. 
	FromHours 
( 
$num !
)! "
;" #
private 
const 
string )
PendingAutoCancellationReason :
=; <
$str N
;N O
private 
const 
string +
ConfirmedAutoCancellationReason <
== >
$str n
;n o
private 
readonly 
ILogger  
<  !)
AppointmentMaintenanceService! >
>> ?
_logger@ G
;G H
private 
readonly  
IServiceScopeFactory - 
_serviceScopeFactory. B
;B C
public )
AppointmentMaintenanceService ,
(, -
ILogger 
< )
AppointmentMaintenanceService 1
>1 2
logger3 9
,9 : 
IServiceScopeFactory  
serviceScopeFactory! 4
)4 5
{ 	
_logger 
= 
logger 
;  
_serviceScopeFactory  
=! "
serviceScopeFactory# 6
;6 7
} 	
	protected 
override 
async  
Task! %
ExecuteAsync& 2
(2 3
CancellationToken 
stoppingToken +
)+ ,
{   	
_logger!! 
.!! 
LogInformation!! "
(!!" #
$str"" 8
)""8 9
;""9 :
try$$ 
{%% 
while&& 
(&& 
!&& 
stoppingToken&& %
.&&% &#
IsCancellationRequested&&& =
)&&= >
{'' 
await(( 
RunMaintenanceAsync(( -
(((- .
stoppingToken((. ;
)((; <
;((< =
await** 
Task** 
.** 
Delay** $
(**$ %
MaintenanceInterval++ +
,+++ ,
stoppingToken,, %
),,% &
;,,& '
}-- 
}.. 
catch// 
(// &
OperationCanceledException// -
ex//. 0
)//0 1
when00 
(00 
stoppingToken00 #
.00# $#
IsCancellationRequested00$ ;
)00; <
{11 
_logger22 
.22 
LogInformation22 &
(22& '
ex33 
,33 
$str44 K
)44K L
;44L M
}55 
finally66 
{77 
_logger88 
.88 
LogInformation88 &
(88& '
$str99 <
)99< =
;99= >
}:: 
};; 	
private== 
async== 
Task== 
RunMaintenanceAsync== .
(==. /
CancellationToken>> 
cancellationToken>> /
)>>/ 0
{?? 	
try@@ 
{AA 
usingBB 
varBB 
scopeBB 
=BB  ! 
_serviceScopeFactoryCC (
.CC( )
CreateScopeCC) 4
(CC4 5
)CC5 6
;CC6 7
varEE 
	dbContextEE 
=EE 
scopeFF 
.FF 
ServiceProviderFF )
.GG 
GetRequiredServiceGG +
<GG+ ,
HealthAxisDbContextGG, ?
>GG? @
(GG@ A
)GGA B
;GGB C
varII 
cacheII 
=II 
scopeJJ 
.JJ 
ServiceProviderJJ )
.KK 
GetRequiredServiceKK +
<KK+ ,
IDistributedCacheKK, =
>KK= >
(KK> ?
)KK? @
;KK@ A
varMM 
todayMM 
=MM 
DateOnlyNN 
.NN 
FromDateTimeNN )
(NN) *
DateTimeNN* 2
.NN2 3
TodayNN3 8
)NN8 9
;NN9 :
varPP )
affectedAvailabilityCacheKeysPP 1
=PP2 3
awaitQQ .
"AutoCancelOverdueAppointmentsAsyncQQ <
(QQ< =
	dbContextRR !
,RR! "
todaySS 
,SS 
cancellationTokenTT )
)TT) *
;TT* +
ifVV 
(VV )
affectedAvailabilityCacheKeysVV 1
.VV1 2
CountVV2 7
>VV8 9
$numVV: ;
)VV; <
{WW 
awaitXX -
!InvalidateAvailabilityCachesAsyncXX ;
(XX; <
cacheYY 
,YY )
affectedAvailabilityCacheKeysZZ 5
,ZZ5 6
cancellationToken[[ )
)[[) *
;[[* +
}\\ 
if^^ 
(^^ 
today^^ 
.^^ 
Day^^ 
==^^  
$num^^! "
)^^" #
{__ 
await`` /
#DeleteOldCancelledAppointmentsAsync`` =
(``= >
	dbContextaa !
,aa! "
todaybb 
,bb 
cancellationTokencc )
)cc) *
;cc* +
}dd 
ifff 
(ff 
_loggerff 
.ff 
	IsEnabledff %
(ff% &
LogLevelff& .
.ff. /
Informationff/ :
)ff: ;
)ff; <
{gg 
_loggerhh 
.hh 
LogInformationhh *
(hh* +
$strii K
,iiK L
DateTimeOffsetjj &
.jj& '
Nowjj' *
)jj* +
;jj+ ,
}kk 
}ll 
catchmm 
(mm 
	Exceptionmm 
exmm 
)mm  
{nn 
ifoo 
(oo 
_loggeroo 
.oo 
	IsEnabledoo %
(oo% &
LogLeveloo& .
.oo. /
Erroroo/ 4
)oo4 5
)oo5 6
{pp 
_loggerqq 
.qq 
LogErrorqq $
(qq$ %
exrr 
,rr 
$strss H
,ssH I
DateTimeOffsettt &
.tt& '
Nowtt' *
)tt* +
;tt+ ,
}uu 
}vv 
}ww 	
privateyy 
asyncyy 
Taskyy 
<yy 
HashSetyy "
<yy" #
stringyy# )
>yy) *
>yy* +.
"AutoCancelOverdueAppointmentsAsyncyy, N
(yyN O
HealthAxisDbContextzz 
	dbContextzz  )
,zz) *
DateOnly{{ 
today{{ 
,{{ 
CancellationToken|| 
cancellationToken|| /
)||/ 0
{}} 	
var~~ 
affectedCacheKeys~~ !
=~~" #
new 
HashSet 
< 
string "
>" #
(# $
)$ %
;% &
var
ÅÅ !
overdueAppointments
ÅÅ #
=
ÅÅ$ %
await
ÇÇ 
	dbContext
ÇÇ 
.
ÇÇ  
Appointments
ÇÇ  ,
.
ÉÉ 
Where
ÉÉ 
(
ÉÉ 
appointment
ÉÉ &
=>
ÉÉ' )
appointment
ÑÑ #
.
ÑÑ# $
ScheduledDate
ÑÑ$ 1
<
ÑÑ2 3
today
ÑÑ4 9
&&
ÑÑ: <
(
ÖÖ 
appointment
ÜÜ '
.
ÜÜ' (
Status
ÜÜ( .
==
ÜÜ/ 1
AppointmentStatus
ÜÜ2 C
.
ÜÜC D
Pending
ÜÜD K
||
ÜÜL N
appointment
áá '
.
áá' (
Status
áá( .
==
áá/ 1
AppointmentStatus
áá2 C
.
ááC D
	Confirmed
ááD M
)
àà 
)
àà 
.
ââ 
ToListAsync
ââ  
(
ââ  !
cancellationToken
ââ! 2
)
ââ2 3
;
ââ3 4
if
ãã 
(
ãã !
overdueAppointments
ãã #
.
ãã# $
Count
ãã$ )
==
ãã* ,
$num
ãã- .
)
ãã. /
{
åå 
if
çç 
(
çç 
_logger
çç 
.
çç 
	IsEnabled
çç %
(
çç% &
LogLevel
çç& .
.
çç. /
Information
çç/ :
)
çç: ;
)
çç; <
{
éé 
_logger
èè 
.
èè 
LogInformation
èè *
(
èè* +
$strêê à
,êêà â
today
ëë 
)
ëë 
;
ëë 
}
íí 
return
îî 
affectedCacheKeys
îî (
;
îî( )
}
ïï 
foreach
óó 
(
óó 
var
óó 
appointment
óó $
in
óó% '!
overdueAppointments
óó( ;
)
óó; <
{
òò 
if
ôô 
(
ôô 
appointment
ôô 
.
ôô  
Status
ôô  &
==
ôô' )
AppointmentStatus
ôô* ;
.
ôô; <
Pending
ôô< C
)
ôôC D
{
öö 
appointment
õõ 
.
õõ  
Status
õõ  &
=
õõ' (
AppointmentStatus
úú )
.
úú) *
	Cancelled
úú* 3
;
úú3 4
appointment
ûû 
.
ûû   
CancellationReason
ûû  2
=
ûû3 4+
PendingAutoCancellationReason
üü 5
;
üü5 6
}
†† 
else
°° 
if
°° 
(
°° 
appointment
°° $
.
°°$ %
Status
°°% +
==
°°, .
AppointmentStatus
°°/ @
.
°°@ A
	Confirmed
°°A J
)
°°J K
{
¢¢ 
appointment
££ 
.
££  
Status
££  &
=
££' (
AppointmentStatus
§§ )
.
§§) *
	Cancelled
§§* 3
;
§§3 4
appointment
¶¶ 
.
¶¶   
CancellationReason
¶¶  2
=
¶¶3 4-
ConfirmedAutoCancellationReason
ßß 7
;
ßß7 8
}
®® 
affectedCacheKeys
™™ !
.
™™! "
Add
™™" %
(
™™% &'
BuildAvailabilityCacheKey
´´ -
(
´´- .
appointment
¨¨ #
.
¨¨# $
DoctorId
¨¨$ ,
,
¨¨, -
appointment
≠≠ #
.
≠≠# $
ScheduledDate
≠≠$ 1
)
≠≠1 2
)
≠≠2 3
;
≠≠3 4
}
ÆÆ 
await
∞∞ 
	dbContext
∞∞ 
.
∞∞ 
SaveChangesAsync
∞∞ ,
(
∞∞, -
cancellationToken
∞∞- >
)
∞∞> ?
;
∞∞? @
if
≤≤ 
(
≤≤ 
_logger
≤≤ 
.
≤≤ 
	IsEnabled
≤≤ !
(
≤≤! "
LogLevel
≤≤" *
.
≤≤* +
Information
≤≤+ 6
)
≤≤6 7
)
≤≤7 8
{
≥≥ 
_logger
¥¥ 
.
¥¥ 
LogInformation
¥¥ &
(
¥¥& '
$str
µµ }
,
µµ} ~!
overdueAppointments
∂∂ '
.
∂∂' (
Count
∂∂( -
,
∂∂- .
today
∑∑ 
)
∑∑ 
;
∑∑ 
}
∏∏ 
return
∫∫ 
affectedCacheKeys
∫∫ $
;
∫∫$ %
}
ªª 	
private
ΩΩ 
async
ΩΩ 
Task
ΩΩ 1
#DeleteOldCancelledAppointmentsAsync
ΩΩ >
(
ΩΩ> ?!
HealthAxisDbContext
ææ 
	dbContext
ææ  )
,
ææ) *
DateOnly
øø 
today
øø 
,
øø 
CancellationToken
¿¿ 
cancellationToken
¿¿ /
)
¿¿/ 0
{
¡¡ 	
var
¬¬ 
currentMonthStart
¬¬ !
=
¬¬" #
new
√√ 
DateOnly
√√ 
(
√√ 
today
√√ "
.
√√" #
Year
√√# '
,
√√' (
today
√√) .
.
√√. /
Month
√√/ 4
,
√√4 5
$num
√√6 7
)
√√7 8
;
√√8 9
var
≈≈ 
targetMonthStart
≈≈  
=
≈≈! "
currentMonthStart
∆∆ !
.
∆∆! "
	AddMonths
∆∆" +
(
∆∆+ ,
-
∆∆, -
$num
∆∆- .
)
∆∆. /
;
∆∆/ 0
var
»» %
targetMonthEndExclusive
»» '
=
»»( )
targetMonthStart
……  
.
……  !
	AddMonths
……! *
(
……* +
$num
……+ ,
)
……, -
;
……- .
var
ÀÀ &
oldCancelledAppointments
ÀÀ (
=
ÀÀ) *
await
ÃÃ 
	dbContext
ÃÃ 
.
ÃÃ  
Appointments
ÃÃ  ,
.
ÕÕ 
Where
ÕÕ 
(
ÕÕ 
appointment
ÕÕ &
=>
ÕÕ' )
appointment
ŒŒ #
.
ŒŒ# $
Status
ŒŒ$ *
==
ŒŒ+ -
AppointmentStatus
ŒŒ. ?
.
ŒŒ? @
	Cancelled
ŒŒ@ I
&&
ŒŒJ L
appointment
œœ #
.
œœ# $
ScheduledDate
œœ$ 1
>=
œœ2 4
targetMonthStart
œœ5 E
&&
œœF H
appointment
–– #
.
––# $
ScheduledDate
––$ 1
<
––2 3%
targetMonthEndExclusive
––4 K
)
––K L
.
—— 
ToListAsync
——  
(
——  !
cancellationToken
——! 2
)
——2 3
;
——3 4
if
”” 
(
”” &
oldCancelledAppointments
”” (
.
””( )
Count
””) .
==
””/ 1
$num
””2 3
)
””3 4
{
‘‘ 
if
’’ 
(
’’ 
_logger
’’ 
.
’’ 
	IsEnabled
’’ %
(
’’% &
LogLevel
’’& .
.
’’. /
Information
’’/ :
)
’’: ;
)
’’; <
{
÷÷ 
var
◊◊ 
targetMonthEnd
◊◊ &
=
◊◊' (%
targetMonthEndExclusive
ÿÿ /
.
ÿÿ/ 0
AddDays
ÿÿ0 7
(
ÿÿ7 8
-
ÿÿ8 9
$num
ÿÿ9 :
)
ÿÿ: ;
;
ÿÿ; <
_logger
⁄⁄ 
.
⁄⁄ 
LogInformation
⁄⁄ *
(
⁄⁄* +
$str€€ ó
,€€ó ò
targetMonthStart
‹‹ (
,
‹‹( )
targetMonthEnd
›› &
)
››& '
;
››' (
}
ﬁﬁ 
return
‡‡ 
;
‡‡ 
}
·· 
	dbContext
„„ 
.
„„ 
Appointments
„„ "
.
„„" #
RemoveRange
„„# .
(
„„. /&
oldCancelledAppointments
‰‰ (
)
‰‰( )
;
‰‰) *
await
ÊÊ 
	dbContext
ÊÊ 
.
ÊÊ 
SaveChangesAsync
ÊÊ ,
(
ÊÊ, -
cancellationToken
ÊÊ- >
)
ÊÊ> ?
;
ÊÊ? @
if
ËË 
(
ËË 
_logger
ËË 
.
ËË 
	IsEnabled
ËË !
(
ËË! "
LogLevel
ËË" *
.
ËË* +
Information
ËË+ 6
)
ËË6 7
)
ËË7 8
{
ÈÈ 
var
ÍÍ 
targetMonthEnd
ÍÍ "
=
ÍÍ# $%
targetMonthEndExclusive
ÎÎ +
.
ÎÎ+ ,
AddDays
ÎÎ, 3
(
ÎÎ3 4
-
ÎÎ4 5
$num
ÎÎ5 6
)
ÎÎ6 7
;
ÎÎ7 8
_logger
ÌÌ 
.
ÌÌ 
LogInformation
ÌÌ &
(
ÌÌ& '
$strÓÓ ß
,ÓÓß ®&
oldCancelledAppointments
ÔÔ ,
.
ÔÔ, -
Count
ÔÔ- 2
,
ÔÔ2 3
targetMonthStart
 $
,
$ %
targetMonthEnd
ÒÒ "
)
ÒÒ" #
;
ÒÒ# $
}
ÚÚ 
}
ÛÛ 	
private
ıı 
async
ıı 
Task
ıı /
!InvalidateAvailabilityCachesAsync
ıı <
(
ıı< =
IDistributedCache
ˆˆ 
cache
ˆˆ #
,
ˆˆ# $
HashSet
˜˜ 
<
˜˜ 
string
˜˜ 
>
˜˜ 
	cacheKeys
˜˜ %
,
˜˜% &
CancellationToken
¯¯ 
cancellationToken
¯¯ /
)
¯¯/ 0
{
˘˘ 	
foreach
˙˙ 
(
˙˙ 
var
˙˙ 
cacheKey
˙˙ !
in
˙˙" $
	cacheKeys
˙˙% .
)
˙˙. /
{
˚˚ 
try
¸¸ 
{
˝˝ 
await
˛˛ 
cache
˛˛ 
.
˛˛  
RemoveAsync
˛˛  +
(
˛˛+ ,
cacheKey
ˇˇ  
,
ˇˇ  !
cancellationToken
ÄÄ )
)
ÄÄ) *
;
ÄÄ* +
if
ÇÇ 
(
ÇÇ 
_logger
ÇÇ 
.
ÇÇ  
	IsEnabled
ÇÇ  )
(
ÇÇ) *
LogLevel
ÇÇ* 2
.
ÇÇ2 3
Information
ÇÇ3 >
)
ÇÇ> ?
)
ÇÇ? @
{
ÉÉ 
_logger
ÑÑ 
.
ÑÑ  
LogInformation
ÑÑ  .
(
ÑÑ. /
$str
ÖÖ t
,
ÖÖt u
cacheKey
ÜÜ $
)
ÜÜ$ %
;
ÜÜ% &
}
áá 
}
àà 
catch
ââ 
(
ââ 
	Exception
ââ  
ex
ââ! #
)
ââ# $
{
ää 
if
ãã 
(
ãã 
_logger
ãã 
.
ãã  
	IsEnabled
ãã  )
(
ãã) *
LogLevel
ãã* 2
.
ãã2 3
Warning
ãã3 :
)
ãã: ;
)
ãã; <
{
åå 
_logger
çç 
.
çç  

LogWarning
çç  *
(
çç* +
ex
éé 
,
éé 
$strèè Å
,èèÅ Ç
cacheKey
êê $
)
êê$ %
;
êê% &
}
ëë 
}
íí 
}
ìì 
}
îî 	
private
ññ 
static
ññ 
string
ññ '
BuildAvailabilityCacheKey
ññ 7
(
ññ7 8
int
óó 
doctorId
óó 
,
óó 
DateOnly
òò 
date
òò 
)
òò 
{
ôô 	
return
öö 
$"
öö 
$str
öö 
{
öö 
doctorId
öö &
}
öö& '
$str
öö' 5
{
öö5 6
date
öö6 :
:
öö: ;
$str
öö; E
}
ööE F
"
ööF G
;
ööG H
}
õõ 	
public
ùù 
override
ùù 
async
ùù 
Task
ùù "
	StopAsync
ùù# ,
(
ùù, -
CancellationToken
ûû 
cancellationToken
ûû /
)
ûû/ 0
{
üü 	
_logger
†† 
.
†† 
LogInformation
†† "
(
††" #
$str
°° L
)
°°L M
;
°°M N
await
££ 
base
££ 
.
££ 
	StopAsync
££  
(
££  !
cancellationToken
££! 2
)
££2 3
;
££3 4
}
§§ 	
}
•• 
}¶¶ 