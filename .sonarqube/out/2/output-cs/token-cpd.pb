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
}## ´
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
}ËË ºŒ
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
ÉÉ 4
(
ÉÉ4 5
doctorId
ÉÉ5 =
,
ÉÉ= >
date
ÉÉ? C
)
ÉÉC D
;
ÉÉD E
var
ÖÖ  
cachedAvailability
ÖÖ "
=
ÖÖ# $
await
ÜÜ 
_cache
ÜÜ 
.
ÜÜ 
GetStringAsync
ÜÜ +
(
ÜÜ+ ,
cacheKey
ÜÜ, 4
)
ÜÜ4 5
;
ÜÜ5 6
if
àà 
(
àà 
!
àà 
string
àà 
.
àà  
IsNullOrWhiteSpace
àà *
(
àà* + 
cachedAvailability
àà+ =
)
àà= >
)
àà> ?
{
ââ 
var
ää 
cachedSlots
ää 
=
ää  !
JsonSerializer
ãã "
.
ãã" #
Deserialize
ãã# .
<
ãã. /
List
ãã/ 3
<
ãã3 4
int
ãã4 7
>
ãã7 8
>
ãã8 9
(
ãã9 : 
cachedAvailability
ãã: L
)
ããL M
??
åå 
[
åå 
]
åå 
;
åå 
_logger
éé 
.
éé 
LogInformation
éé &
(
éé& '
$str
èè k
,
èèk l
doctorId
êê 
,
êê 
date
ëë 
,
ëë 
cacheKey
íí 
)
íí 
;
íí 
return
îî 
cachedSlots
îî "
;
îî" #
}
ïï 
_logger
óó 
.
óó 
LogInformation
óó "
(
óó" #
$str
òò h
,
òòh i
doctorId
ôô 
,
ôô 
date
öö 
,
öö 
cacheKey
õõ 
)
õõ 
;
õõ 
var
ùù 
bookedSlots
ùù 
=
ùù 
await
ûû 
_doctorRepository
ûû '
.
ûû' (!
GetBookedSlotsAsync
ûû( ;
(
ûû; <
doctorId
üü 
,
üü 
date
†† 
)
†† 
;
†† 
var
¢¢ 
allSlots
¢¢ 
=
¢¢ 
Enum
££ 
.
££ 
	GetValues
££ 
<
££ !
AppointmentTimeSlot
££ 2
>
££2 3
(
££3 4
)
££4 5
.
§§ 
Select
§§ 
(
§§ 
slot
§§  
=>
§§! #
(
§§$ %
int
§§% (
)
§§( )
slot
§§) -
)
§§- .
;
§§. /
var
¶¶ 
availableSlots
¶¶ 
=
¶¶  
allSlots
ßß 
.
®® 
Except
®® 
(
®® 
bookedSlots
®® '
)
®®' (
.
©© 
ToList
©© 
(
©© 
)
©© 
;
©© 
var
´´ $
serializedAvailability
´´ &
=
´´' (
JsonSerializer
¨¨ 
.
¨¨ 
	Serialize
¨¨ (
(
¨¨( )
availableSlots
¨¨) 7
)
¨¨7 8
;
¨¨8 9
await
ÆÆ 
_cache
ÆÆ 
.
ÆÆ 
SetStringAsync
ÆÆ '
(
ÆÆ' (
cacheKey
ØØ 
,
ØØ $
serializedAvailability
∞∞ &
,
∞∞& '
new
±± *
DistributedCacheEntryOptions
±± 0
{
≤≤ -
AbsoluteExpirationRelativeToNow
≥≥ 3
=
≥≥4 5'
AvailabilityCacheDuration
≥≥6 O
}
¥¥ 
)
¥¥ 
;
¥¥ 
_logger
∂∂ 
.
∂∂ 
LogInformation
∂∂ "
(
∂∂" #
$str
∑∑ }
,
∑∑} ~
doctorId
∏∏ 
,
∏∏ 
date
ππ 
,
ππ 
cacheKey
∫∫ 
,
∫∫ '
AvailabilityCacheDuration
ªª )
.
ªª) *
TotalMinutes
ªª* 6
)
ªª6 7
;
ªª7 8
return
ΩΩ 
availableSlots
ΩΩ !
;
ΩΩ! "
}
ææ 	
public
¿¿ 
async
¿¿ 
Task
¿¿ 
<
¿¿ %
DoctorCreationResultDto
¿¿ 1
>
¿¿1 2*
CreateDoctorWithAccountAsync
¿¿3 O
(
¿¿O P
CreateDoctorDto
¡¡ 
dto
¡¡ 
)
¡¡  
{
¬¬ 	
ValidateDoctor
√√ 
(
√√ 
dto
√√ 
)
√√ 
;
√√  
if
≈≈ 
(
≈≈ 
await
≈≈ 
_userService
≈≈ "
.
≈≈" #
EmailExistsAsync
≈≈# 3
(
≈≈3 4
dto
≈≈4 7
.
≈≈7 8
Email
≈≈8 =
)
≈≈= >
)
≈≈> ?
{
∆∆ 
throw
«« 
new
«« 
ArgumentException
«« +
(
««+ ,
$str
««, C
)
««C D
;
««D E
}
»» 
var
   
doctor
   
=
   
new
   
Doctor
   #
{
ÀÀ 
FullName
ÃÃ 
=
ÃÃ 
dto
ÃÃ 
.
ÃÃ 
FullName
ÃÃ '
.
ÃÃ' (
Trim
ÃÃ( ,
(
ÃÃ, -
)
ÃÃ- .
,
ÃÃ. /
Email
ÕÕ 
=
ÕÕ 
dto
ÕÕ 
.
ÕÕ 
Email
ÕÕ !
.
ÕÕ! "
Trim
ÕÕ" &
(
ÕÕ& '
)
ÕÕ' (
.
ÕÕ( )
ToLower
ÕÕ) 0
(
ÕÕ0 1
)
ÕÕ1 2
,
ÕÕ2 3
Specialisation
ŒŒ 
=
ŒŒ  
(
ŒŒ! ""
DoctorSpecialisation
ŒŒ" 6
)
ŒŒ6 7
dto
ŒŒ7 :
.
ŒŒ: ;
Specialisation
ŒŒ; I
,
ŒŒI J
YearsOfExperience
œœ !
=
œœ" #
dto
œœ$ '
.
œœ' (
YearsOfExperience
œœ( 9
,
œœ9 :
ConsultationFee
–– 
=
––  !
dto
––" %
.
––% &
ConsultationFee
––& 5
,
––5 6
IsActive
—— 
=
—— 
true
—— 
}
““ 
;
““ 
await
‘‘ 
_doctorRepository
‘‘ #
.
‘‘# $
AddAsync
‘‘$ ,
(
‘‘, -
doctor
‘‘- 3
)
‘‘3 4
;
‘‘4 5
await
’’ 
_doctorRepository
’’ #
.
’’# $
SaveChangesAsync
’’$ 4
(
’’4 5
)
’’5 6
;
’’6 7
var
◊◊ 
temporaryPassword
◊◊ !
=
◊◊" #'
GenerateTemporaryPassword
ÿÿ )
(
ÿÿ) *
)
ÿÿ* +
;
ÿÿ+ ,
var
⁄⁄ 
user
⁄⁄ 
=
⁄⁄ 
new
⁄⁄ 
User
⁄⁄ 
{
€€ 
Email
‹‹ 
=
‹‹ 
doctor
‹‹ 
.
‹‹ 
Email
‹‹ $
,
‹‹$ %
Role
›› 
=
›› 
UserRole
›› 
.
››  
Doctor
››  &
,
››& '
ReferenceId
ﬁﬁ 
=
ﬁﬁ 
doctor
ﬁﬁ $
.
ﬁﬁ$ %
DoctorId
ﬁﬁ% -
,
ﬁﬁ- .
CreatedDate
ﬂﬂ 
=
ﬂﬂ 
DateTime
ﬂﬂ &
.
ﬂﬂ& '
UtcNow
ﬂﬂ' -
,
ﬂﬂ- . 
MustChangePassword
‡‡ "
=
‡‡# $
true
‡‡% )
}
·· 
;
·· 
user
„„ 
.
„„ 
PasswordHash
„„ 
=
„„ 
_passwordHasher
‰‰ 
.
‰‰  
HashPassword
‰‰  ,
(
‰‰, -
user
‰‰- 1
,
‰‰1 2
temporaryPassword
‰‰3 D
)
‰‰D E
;
‰‰E F
await
ÊÊ 
_userService
ÊÊ 
.
ÊÊ 
CreateAsync
ÊÊ *
(
ÊÊ* +
user
ÊÊ+ /
)
ÊÊ/ 0
;
ÊÊ0 1
await
ÁÁ 
_userService
ÁÁ 
.
ÁÁ 
SaveChangesAsync
ÁÁ /
(
ÁÁ/ 0
)
ÁÁ0 1
;
ÁÁ1 2
return
ÈÈ 
new
ÈÈ %
DoctorCreationResultDto
ÈÈ .
{
ÍÍ 
DoctorId
ÎÎ 
=
ÎÎ 
doctor
ÎÎ !
.
ÎÎ! "
DoctorId
ÎÎ" *
,
ÎÎ* +
FullName
ÏÏ 
=
ÏÏ 
doctor
ÏÏ !
.
ÏÏ! "
FullName
ÏÏ" *
,
ÏÏ* +
Email
ÌÌ 
=
ÌÌ 
doctor
ÌÌ 
.
ÌÌ 
Email
ÌÌ $
,
ÌÌ$ %
TemporaryPassword
ÓÓ !
=
ÓÓ" #
temporaryPassword
ÓÓ$ 5
}
ÔÔ 
;
ÔÔ 
}
 	
public
ÚÚ 
async
ÚÚ 
Task
ÚÚ 
ActivateAsync
ÚÚ '
(
ÚÚ' (
int
ÚÚ( +
id
ÚÚ, .
)
ÚÚ. /
{
ÛÛ 	
var
ÙÙ 
doctor
ÙÙ 
=
ÙÙ 
await
ıı 
_doctorRepository
ıı '
.
ıı' (
GetByIdAsync
ıı( 4
(
ıı4 5
id
ıı5 7
)
ıı7 8
;
ıı8 9
if
˜˜ 
(
˜˜ 
doctor
˜˜ 
==
˜˜ 
null
˜˜ 
)
˜˜ 
{
¯¯ 
throw
˘˘ 
new
˘˘ "
KeyNotFoundException
˘˘ .
(
˘˘. /
$"
˙˙ 
$str
˙˙ %
{
˙˙% &
id
˙˙& (
}
˙˙( )
$str
˙˙) 4
"
˙˙4 5
)
˙˙5 6
;
˙˙6 7
}
˚˚ 
doctor
˝˝ 
.
˝˝ 
IsActive
˝˝ 
=
˝˝ 
true
˝˝ "
;
˝˝" #
await
ˇˇ 
_doctorRepository
ˇˇ #
.
ˇˇ# $
UpdateAsync
ˇˇ$ /
(
ˇˇ/ 0
doctor
ˇˇ0 6
)
ˇˇ6 7
;
ˇˇ7 8
await
ÄÄ 
_doctorRepository
ÄÄ #
.
ÄÄ# $
SaveChangesAsync
ÄÄ$ 4
(
ÄÄ4 5
)
ÄÄ5 6
;
ÄÄ6 7
}
ÅÅ 	
public
ÉÉ 
async
ÉÉ 
Task
ÉÉ 
DeactivateAsync
ÉÉ )
(
ÉÉ) *
int
ÉÉ* -
id
ÉÉ. 0
)
ÉÉ0 1
{
ÑÑ 	
var
ÖÖ 
doctor
ÖÖ 
=
ÖÖ 
await
ÜÜ 
_doctorRepository
ÜÜ '
.
ÜÜ' (
GetByIdAsync
ÜÜ( 4
(
ÜÜ4 5
id
ÜÜ5 7
)
ÜÜ7 8
;
ÜÜ8 9
if
àà 
(
àà 
doctor
àà 
==
àà 
null
àà 
)
àà 
{
ââ 
throw
ää 
new
ää "
KeyNotFoundException
ää .
(
ää. /
$"
ãã 
$str
ãã %
{
ãã% &
id
ãã& (
}
ãã( )
$str
ãã) 4
"
ãã4 5
)
ãã5 6
;
ãã6 7
}
åå 
doctor
éé 
.
éé 
IsActive
éé 
=
éé 
false
éé #
;
éé# $
await
êê 
_doctorRepository
êê #
.
êê# $
UpdateAsync
êê$ /
(
êê/ 0
doctor
êê0 6
)
êê6 7
;
êê7 8
await
ëë 
_doctorRepository
ëë #
.
ëë# $
SaveChangesAsync
ëë$ 4
(
ëë4 5
)
ëë5 6
;
ëë6 7
}
íí 	
private
îî 
static
îî 
string
îî '
BuildAvailabilityCacheKey
îî 7
(
îî7 8
int
ïï 
doctorId
ïï 
,
ïï 
DateOnly
ññ 
date
ññ 
)
ññ 
{
óó 	
return
òò 
$"
òò 
$str
òò 
{
òò 
doctorId
òò &
}
òò& '
$str
òò' 5
{
òò5 6
date
òò6 :
:
òò: ;
$str
òò; E
}
òòE F
"
òòF G
;
òòG H
}
ôô 	
private
õõ 
static
õõ 
void
õõ 
ValidateDoctor
õõ *
(
õõ* +
CreateDoctorDto
õõ+ :
dto
õõ; >
)
õõ> ?
{
úú 	
if
ùù 
(
ùù 
string
ùù 
.
ùù  
IsNullOrWhiteSpace
ùù )
(
ùù) *
dto
ùù* -
.
ùù- .
FullName
ùù. 6
)
ùù6 7
)
ùù7 8
{
ûû 
throw
üü 
new
üü 
ArgumentException
üü +
(
üü+ ,
$str
üü, F
)
üüF G
;
üüG H
}
†† 
if
¢¢ 
(
¢¢ 
string
¢¢ 
.
¢¢  
IsNullOrWhiteSpace
¢¢ )
(
¢¢) *
dto
¢¢* -
.
¢¢- .
Email
¢¢. 3
)
¢¢3 4
)
¢¢4 5
{
££ 
throw
§§ 
new
§§ 
ArgumentException
§§ +
(
§§+ ,
$str
§§, @
)
§§@ A
;
§§A B
}
•• 
if
ßß 
(
ßß 
!
ßß 
Enum
ßß 
.
ßß 
	IsDefined
ßß 
(
ßß  
typeof
ßß  &
(
ßß& '"
DoctorSpecialisation
ßß' ;
)
ßß; <
,
ßß< =
dto
ßß> A
.
ßßA B
Specialisation
ßßB P
)
ßßP Q
)
ßßQ R
{
®® 
throw
©© 
new
©© 
ArgumentException
©© +
(
©©+ ,
$str
©©, L
)
©©L M
;
©©M N
}
™™ 
if
¨¨ 
(
¨¨ 
dto
¨¨ 
.
¨¨ 
YearsOfExperience
¨¨ %
<
¨¨& '
$num
¨¨( )
||
¨¨* ,
dto
¨¨- 0
.
¨¨0 1
YearsOfExperience
¨¨1 B
>
¨¨C D
$num
¨¨E G
)
¨¨G H
{
≠≠ 
throw
ÆÆ 
new
ÆÆ 
ArgumentException
ÆÆ +
(
ÆÆ+ ,
$str
ØØ @
)
ØØ@ A
;
ØØA B
}
∞∞ 
if
≤≤ 
(
≤≤ 
dto
≤≤ 
.
≤≤ 
ConsultationFee
≤≤ #
<=
≤≤$ &
$num
≤≤' (
)
≤≤( )
{
≥≥ 
throw
¥¥ 
new
¥¥ 
ArgumentException
¥¥ +
(
¥¥+ ,
$str
µµ A
)
µµA B
;
µµB C
}
∂∂ 
}
∑∑ 	
private
ππ 
static
ππ 
void
ππ 
ValidateDoctor
ππ *
(
ππ* +
UpdateDoctorDto
ππ+ :
dto
ππ; >
)
ππ> ?
{
∫∫ 	
if
ªª 
(
ªª 
string
ªª 
.
ªª  
IsNullOrWhiteSpace
ªª )
(
ªª) *
dto
ªª* -
.
ªª- .
FullName
ªª. 6
)
ªª6 7
)
ªª7 8
{
ºº 
throw
ΩΩ 
new
ΩΩ 
ArgumentException
ΩΩ +
(
ΩΩ+ ,
$str
ΩΩ, F
)
ΩΩF G
;
ΩΩG H
}
ææ 
if
¿¿ 
(
¿¿ 
!
¿¿ 
Enum
¿¿ 
.
¿¿ 
	IsDefined
¿¿ 
(
¿¿  
typeof
¿¿  &
(
¿¿& '"
DoctorSpecialisation
¿¿' ;
)
¿¿; <
,
¿¿< =
dto
¿¿> A
.
¿¿A B
Specialisation
¿¿B P
)
¿¿P Q
)
¿¿Q R
{
¡¡ 
throw
¬¬ 
new
¬¬ 
ArgumentException
¬¬ +
(
¬¬+ ,
$str
¬¬, L
)
¬¬L M
;
¬¬M N
}
√√ 
if
≈≈ 
(
≈≈ 
dto
≈≈ 
.
≈≈ 
YearsOfExperience
≈≈ %
<
≈≈& '
$num
≈≈( )
||
≈≈* ,
dto
≈≈- 0
.
≈≈0 1
YearsOfExperience
≈≈1 B
>
≈≈C D
$num
≈≈E G
)
≈≈G H
{
∆∆ 
throw
«« 
new
«« 
ArgumentException
«« +
(
««+ ,
$str
»» @
)
»»@ A
;
»»A B
}
…… 
if
ÀÀ 
(
ÀÀ 
dto
ÀÀ 
.
ÀÀ 
ConsultationFee
ÀÀ #
<=
ÀÀ$ &
$num
ÀÀ' (
)
ÀÀ( )
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
ŒŒ A
)
ŒŒA B
;
ŒŒB C
}
œœ 
}
–– 	
private
““ 
static
““ 
string
““ '
GenerateTemporaryPassword
““ 7
(
““7 8
)
““8 9
{
”” 	
return
‘‘ 
$"
‘‘ 
$str
‘‘ 
{
‘‘ 
Random
‘‘  
.
‘‘  !
Shared
‘‘! '
.
‘‘' (
Next
‘‘( ,
(
‘‘, -
$num
‘‘- 3
,
‘‘3 4
$num
‘‘5 ;
)
‘‘; <
}
‘‘< =
"
‘‘= >
;
‘‘> ?
}
’’ 	
private
◊◊ 
static
◊◊ 
	DoctorDto
◊◊  
MapToDoctorDto
◊◊! /
(
◊◊/ 0
Doctor
◊◊0 6
doctor
◊◊7 =
)
◊◊= >
{
ÿÿ 	
return
ŸŸ 
new
ŸŸ 
	DoctorDto
ŸŸ  
{
⁄⁄ 
DoctorId
€€ 
=
€€ 
doctor
€€ !
.
€€! "
DoctorId
€€" *
,
€€* +
FullName
‹‹ 
=
‹‹ 
doctor
‹‹ !
.
‹‹! "
FullName
‹‹" *
,
‹‹* +
Email
›› 
=
›› 
doctor
›› 
.
›› 
Email
›› $
,
››$ %
Specialisation
ﬁﬁ 
=
ﬁﬁ  
(
ﬁﬁ! "
int
ﬁﬁ" %
)
ﬁﬁ% &
doctor
ﬁﬁ& ,
.
ﬁﬁ, -
Specialisation
ﬁﬁ- ;
,
ﬁﬁ; <
YearsOfExperience
ﬂﬂ !
=
ﬂﬂ" #
doctor
ﬂﬂ$ *
.
ﬂﬂ* +
YearsOfExperience
ﬂﬂ+ <
,
ﬂﬂ< =
ConsultationFee
‡‡ 
=
‡‡  !
doctor
‡‡" (
.
‡‡( )
ConsultationFee
‡‡) 8
,
‡‡8 9
IsActive
·· 
=
·· 
doctor
·· !
.
··! "
IsActive
··" *
}
‚‚ 
;
‚‚ 
}
„„ 	
}
‰‰ 
}ÂÂ üˆ
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
}éé ∞
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
} ≥£
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
IRabbitMqPublisher +
_rabbitMqPublisher, >
;> ?
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
IRabbitMqPublisher 
rabbitMqPublisher 0
,0 1
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
_rabbitMqPublisher!! 
=!!  
rabbitMqPublisher!!! 2
;!!2 3
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
await(( $"
_appointmentRepository((% ;
.((; <
GetAllAsync((< G
(((G H
)((H I
;((I J
return** 
appointments** 
.**  
Select**  &
(**& '&
MapToAppointmentDetailsDto**' A
)**A B
;**B C
}++ 	
public-- 
async-- 
Task-- 
<-- !
AppointmentDetailsDto-- /
?--/ 0
>--0 1
GetByIdAsync--2 >
(--> ?
int--? B
id--C E
)--E F
{.. 	
var// 
appointment// 
=// 
await// #"
_appointmentRepository//$ :
.//: ;
GetByIdAsync//; G
(//G H
id//H J
)//J K
;//K L
if11 
(11 
appointment11 
==11 
null11 #
)11# $
{22 
return33 
null33 
;33 
}44 
return66 &
MapToAppointmentDetailsDto66 -
(66- .
appointment66. 9
)669 :
;66: ;
}77 	
public99 
async99 
Task99 
<99 
IEnumerable99 %
<99% &(
PatientAppointmentHistoryDto99& B
>99B C
>99C D"
GetPatientHistoryAsync99E [
(99[ \
int99\ _
	patientId99` i
)99i j
{:: 	
var;; 
appointments;; 
=;; 
await;; $"
_appointmentRepository;;% ;
.;;; <
GetByPatientIdAsync;;< O
(;;O P
	patientId;;P Y
);;Y Z
;;;Z [
return== 
appointments== 
.==  
Select==  &
(==& '
a==' (
=>==) +
new==, /(
PatientAppointmentHistoryDto==0 L
{>> 
AppointmentId?? 
=?? 
a??  !
.??! "
AppointmentId??" /
,??/ 0
ScheduledDate@@ 
=@@ 
a@@  !
.@@! "
ScheduledDate@@" /
,@@/ 0
TimeSlotAA 
=AA 
(AA 
intAA 
)AA  
aAA  !
.AA! "
TimeSlotAA" *
,AA* +
DoctorIdBB 
=BB 
aBB 
.BB 
DoctorIdBB %
,BB% &

DoctorNameCC 
=CC 
aCC 
.CC 
DoctorCC %
.CC% &
FullNameCC& .
,CC. /
StatusDD 
=DD 
(DD 
intDD 
)DD 
aDD 
.DD  
StatusDD  &
}EE 
)EE 
;EE 
}FF 	
publicHH 
asyncHH 
TaskHH 
<HH 
IEnumerableHH %
<HH% &!
DoctorScheduleItemDtoHH& ;
>HH; <
>HH< ='
GetDoctorTodayScheduleAsyncHH> Y
(HHY Z
intHHZ ]
doctorIdHH^ f
)HHf g
{II 	
varJJ 
appointmentsJJ 
=JJ 
awaitKK "
_appointmentRepositoryKK ,
.KK, -'
GetDoctorTodayScheduleAsyncKK- H
(KKH I
doctorIdLL 
,LL 
DateOnlyMM 
.MM 
FromDateTimeMM )
(MM) *
DateTimeMM* 2
.MM2 3
TodayMM3 8
)MM8 9
)MM9 :
;MM: ;
returnOO 
appointmentsOO 
.OO  
SelectOO  &
(OO& '!
MapDoctorScheduleItemOO' <
)OO< =
;OO= >
}PP 	
publicRR 
asyncRR 
TaskRR 
<RR 
IEnumerableRR %
<RR% &!
DoctorScheduleItemDtoRR& ;
>RR; <
>RR< =&
GetDoctorWeekScheduleAsyncRR> X
(RRX Y
intSS 
doctorIdSS 
,SS 
DateOnlyTT 
	startDateTT 
,TT 
DateOnlyUU 
endDateUU 
)UU 
{VV 	
varWW 
appointmentsWW 
=WW 
awaitXX "
_appointmentRepositoryXX ,
.XX, -&
GetDoctorWeekScheduleAsyncXX- G
(XXG H
doctorIdYY 
,YY 
	startDateZZ 
,ZZ 
endDate[[ 
)[[ 
;[[ 
return]] 
appointments]] 
.]]  
Select]]  &
(]]& '!
MapDoctorScheduleItem]]' <
)]]< =
;]]= >
}^^ 	
public`` 
async`` 
Task`` 
<`` 
AppointmentDto`` (
>``( )
CreateAsync``* 5
(``5 6 
CreateAppointmentDto``6 J
dto``K N
)``N O
{aa 	
awaitbb  
ValidateBookingAsyncbb &
(bb& '
dtocc 
.cc 
	PatientIdcc 
,cc 
dtodd 
.dd 
DoctorIddd 
,dd 
dtoee 
.ee 
ScheduledDateee !
,ee! "
dtoff 
.ff 
TimeSlotff 
)ff 
;ff 
varhh 
appointmenthh 
=hh 
newhh !
Appointmenthh" -
{ii 
	PatientIdjj 
=jj 
dtojj 
.jj  
	PatientIdjj  )
,jj) *
DoctorIdkk 
=kk 
dtokk 
.kk 
DoctorIdkk '
,kk' (
ScheduledDatell 
=ll 
dtoll  #
.ll# $
ScheduledDatell$ 1
,ll1 2
TimeSlotmm 
=mm 
(mm 
AppointmentTimeSlotmm /
)mm/ 0
dtomm0 3
.mm3 4
TimeSlotmm4 <
,mm< =
Statusnn 
=nn 
AppointmentStatusnn *
.nn* +
Pendingnn+ 2
}oo 
;oo 
awaitqq "
_appointmentRepositoryqq (
.qq( )
AddAsyncqq) 1
(qq1 2
appointmentqq2 =
)qq= >
;qq> ?
awaitrr "
_appointmentRepositoryrr (
.rr( )
SaveChangesAsyncrr) 9
(rr9 :
)rr: ;
;rr; <
awaittt 2
&InvalidateDoctorAvailabilityCacheAsynctt 8
(tt8 9
appointmentuu 
.uu 
DoctorIduu $
,uu$ %
appointmentvv 
.vv 
ScheduledDatevv )
)vv) *
;vv* +
varxx 
patientxx 
=xx 
awaitxx 
_patientRepositoryxx  2
.xx2 3
GetByIdAsyncxx3 ?
(xx? @
dtoxx@ C
.xxC D
	PatientIdxxD M
)xxM N
;xxN O
awaitzz 
_rabbitMqPublisherzz $
.zz$ %
PublishAsynczz% 1
(zz1 2
new{{ "
AppointmentBookedEvent{{ *
{|| 
AppointmentId}} !
=}}" #
appointment}}$ /
.}}/ 0
AppointmentId}}0 =
,}}= >
PatientName~~ 
=~~  !
patient~~" )
?~~) *
.~~* +
FullName~~+ 3
??~~4 6
$str~~7 @
,~~@ A
DoctorId 
= 
appointment *
.* +
DoctorId+ 3
,3 4
ScheduledDate
ÄÄ !
=
ÄÄ" #
appointment
ÄÄ$ /
.
ÄÄ/ 0
ScheduledDate
ÄÄ0 =
,
ÄÄ= >
TimeSlot
ÅÅ 
=
ÅÅ 
appointment
ÅÅ *
.
ÅÅ* +
TimeSlot
ÅÅ+ 3
.
ÅÅ3 4
ToString
ÅÅ4 <
(
ÅÅ< =
)
ÅÅ= >
}
ÇÇ 
)
ÇÇ 
;
ÇÇ 
_logger
ÑÑ 
.
ÑÑ 
LogInformation
ÑÑ "
(
ÑÑ" #
$strÖÖ ±
,ÖÖ± ≤
appointment
ÜÜ 
.
ÜÜ 
AppointmentId
ÜÜ )
,
ÜÜ) *
appointment
áá 
.
áá 
	PatientId
áá %
,
áá% &
appointment
àà 
.
àà 
DoctorId
àà $
,
àà$ %
appointment
ââ 
.
ââ 
ScheduledDate
ââ )
,
ââ) *
appointment
ää 
.
ää 
TimeSlot
ää $
)
ää$ %
;
ää% &
_logger
åå 
.
åå 
LogInformation
åå "
(
åå" #
$strçç Å
,ççÅ Ç
appointment
éé 
.
éé 
AppointmentId
éé )
,
éé) *
appointment
èè 
.
èè 
	PatientId
èè %
,
èè% &
appointment
êê 
.
êê 
DoctorId
êê $
)
êê$ %
;
êê% &
return
íí !
MapToAppointmentDto
íí &
(
íí& '
appointment
íí' 2
)
íí2 3
;
íí3 4
}
ìì 	
public
ïï 
async
ïï 
Task
ïï 
UpdateAsync
ïï %
(
ïï% &
int
ïï& )
id
ïï* ,
,
ïï, -"
UpdateAppointmentDto
ïï. B
dto
ïïC F
)
ïïF G
{
ññ 	
var
óó 
appointment
óó 
=
óó 
await
óó #$
_appointmentRepository
óó$ :
.
óó: ;
GetByIdAsync
óó; G
(
óóG H
id
óóH J
)
óóJ K
;
óóK L
if
ôô 
(
ôô 
appointment
ôô 
==
ôô 
null
ôô #
)
ôô# $
{
öö 
throw
õõ 
new
õõ "
KeyNotFoundException
õõ .
(
õõ. /
$"
õõ/ 1
$str
õõ1 =
{
õõ= >
id
õõ> @
}
õõ@ A
$str
õõA L
"
õõL M
)
õõM N
;
õõN O
}
úú 
if
ûû 
(
ûû 
appointment
ûû 
.
ûû 
Status
ûû "
==
ûû# %
AppointmentStatus
ûû& 7
.
ûû7 8
	Completed
ûû8 A
)
ûûA B
{
üü 
throw
†† 
new
†† '
InvalidOperationException
†† 3
(
††3 4
$str
††4 `
)
††` a
;
††a b
}
°° 
if
££ 
(
££ 
appointment
££ 
.
££ 
Status
££ "
==
££# %
AppointmentStatus
££& 7
.
££7 8
	Cancelled
££8 A
)
££A B
{
§§ 
throw
•• 
new
•• '
InvalidOperationException
•• 3
(
••3 4
$str
••4 `
)
••` a
;
••a b
}
¶¶ 
await
®® (
ValidateUpdateBookingAsync
®® ,
(
®®, -
appointment
©© 
.
©© 
AppointmentId
©© )
,
©©) *
appointment
™™ 
.
™™ 
	PatientId
™™ %
,
™™% &
dto
´´ 
.
´´ 
DoctorId
´´ 
,
´´ 
dto
¨¨ 
.
¨¨ 
ScheduledDate
¨¨ !
,
¨¨! "
dto
≠≠ 
.
≠≠ 
TimeSlot
≠≠ 
)
≠≠ 
;
≠≠ 
var
ØØ 
oldDoctorId
ØØ 
=
ØØ 
appointment
ØØ )
.
ØØ) *
DoctorId
ØØ* 2
;
ØØ2 3
var
∞∞ 
oldScheduledDate
∞∞  
=
∞∞! "
appointment
∞∞# .
.
∞∞. /
ScheduledDate
∞∞/ <
;
∞∞< =
appointment
≤≤ 
.
≤≤ 
DoctorId
≤≤  
=
≤≤! "
dto
≤≤# &
.
≤≤& '
DoctorId
≤≤' /
;
≤≤/ 0
appointment
≥≥ 
.
≥≥ 
ScheduledDate
≥≥ %
=
≥≥& '
dto
≥≥( +
.
≥≥+ ,
ScheduledDate
≥≥, 9
;
≥≥9 :
appointment
¥¥ 
.
¥¥ 
TimeSlot
¥¥  
=
¥¥! "
(
¥¥# $!
AppointmentTimeSlot
¥¥$ 7
)
¥¥7 8
dto
¥¥8 ;
.
¥¥; <
TimeSlot
¥¥< D
;
¥¥D E
await
∂∂ $
_appointmentRepository
∂∂ (
.
∂∂( )
UpdateAsync
∂∂) 4
(
∂∂4 5
appointment
∂∂5 @
)
∂∂@ A
;
∂∂A B
await
∑∑ $
_appointmentRepository
∑∑ (
.
∑∑( )
SaveChangesAsync
∑∑) 9
(
∑∑9 :
)
∑∑: ;
;
∑∑; <
await
ππ 4
&InvalidateDoctorAvailabilityCacheAsync
ππ 8
(
ππ8 9
oldDoctorId
∫∫ 
,
∫∫ 
oldScheduledDate
ªª  
)
ªª  !
;
ªª! "
await
ΩΩ 4
&InvalidateDoctorAvailabilityCacheAsync
ΩΩ 8
(
ΩΩ8 9
appointment
ææ 
.
ææ 
DoctorId
ææ $
,
ææ$ %
appointment
øø 
.
øø 
ScheduledDate
øø )
)
øø) *
;
øø* +
}
¿¿ 	
public
¬¬ 
async
¬¬ 
Task
¬¬ 
UpdateStatusAsync
¬¬ +
(
¬¬+ ,
int
¬¬, /
id
¬¬0 2
,
¬¬2 3(
UpdateAppointmentStatusDto
¬¬4 N
dto
¬¬O R
)
¬¬R S
{
√√ 	
var
ƒƒ 
appointment
ƒƒ 
=
ƒƒ 
await
ƒƒ #$
_appointmentRepository
ƒƒ$ :
.
ƒƒ: ;
GetByIdAsync
ƒƒ; G
(
ƒƒG H
id
ƒƒH J
)
ƒƒJ K
;
ƒƒK L
if
∆∆ 
(
∆∆ 
appointment
∆∆ 
==
∆∆ 
null
∆∆ #
)
∆∆# $
{
«« 
throw
»» 
new
»» "
KeyNotFoundException
»» .
(
»». /
$"
»»/ 1
$str
»»1 =
{
»»= >
id
»»> @
}
»»@ A
$str
»»A L
"
»»L M
)
»»M N
;
»»N O
}
…… 
if
ÀÀ 
(
ÀÀ 
!
ÀÀ 
Enum
ÀÀ 
.
ÀÀ 
	IsDefined
ÀÀ 
(
ÀÀ  
typeof
ÀÀ  &
(
ÀÀ& '
AppointmentStatus
ÀÀ' 8
)
ÀÀ8 9
,
ÀÀ9 :
dto
ÀÀ; >
.
ÀÀ> ?
Status
ÀÀ? E
)
ÀÀE F
)
ÀÀF G
{
ÃÃ 
throw
ÕÕ 
new
ÕÕ 
ArgumentException
ÕÕ +
(
ÕÕ+ ,
$str
ÕÕ, I
)
ÕÕI J
;
ÕÕJ K
}
ŒŒ 
var
–– 
	newStatus
–– 
=
–– 
(
–– 
AppointmentStatus
–– .
)
––. /
dto
––/ 2
.
––2 3
Status
––3 9
;
––9 :
var
—— /
!shouldInvalidateAvailabilityCache
—— 1
=
——2 3
false
——4 9
;
——9 :
if
”” 
(
”” 
appointment
”” 
.
”” 
Status
”” "
==
””# %
AppointmentStatus
””& 7
.
””7 8
	Completed
””8 A
)
””A B
{
‘‘ 
throw
’’ 
new
’’ '
InvalidOperationException
’’ 3
(
’’3 4
$str
’’4 `
)
’’` a
;
’’a b
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
	Cancelled
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
⁄⁄4 `
)
⁄⁄` a
;
⁄⁄a b
}
€€ 
switch
›› 
(
›› 
	newStatus
›› 
)
›› 
{
ﬁﬁ 
case
ﬂﬂ 
AppointmentStatus
ﬂﬂ &
.
ﬂﬂ& '
Pending
ﬂﬂ' .
:
ﬂﬂ. /
throw
‡‡ 
new
‡‡ '
InvalidOperationException
‡‡ 7
(
‡‡7 8
$str
‡‡8 m
)
‡‡m n
;
‡‡n o
case
‚‚ 
AppointmentStatus
‚‚ &
.
‚‚& '
	Confirmed
‚‚' 0
:
‚‚0 1
if
„„ 
(
„„ 
appointment
„„ #
.
„„# $
Status
„„$ *
!=
„„+ -
AppointmentStatus
„„. ?
.
„„? @
Pending
„„@ G
)
„„G H
{
‰‰ 
throw
ÂÂ 
new
ÂÂ !'
InvalidOperationException
ÂÂ" ;
(
ÂÂ; <
$str
ÂÂ< i
)
ÂÂi j
;
ÂÂj k
}
ÊÊ 
appointment
ËË 
.
ËË  
Status
ËË  &
=
ËË' (
AppointmentStatus
ËË) :
.
ËË: ;
	Confirmed
ËË; D
;
ËËD E
break
ÈÈ 
;
ÈÈ 
case
ÎÎ 
AppointmentStatus
ÎÎ &
.
ÎÎ& '
	Completed
ÎÎ' 0
:
ÎÎ0 1
if
ÏÏ 
(
ÏÏ 
appointment
ÏÏ #
.
ÏÏ# $
Status
ÏÏ$ *
!=
ÏÏ+ -
AppointmentStatus
ÏÏ. ?
.
ÏÏ? @
	Confirmed
ÏÏ@ I
)
ÏÏI J
{
ÌÌ 
throw
ÓÓ 
new
ÓÓ !'
InvalidOperationException
ÓÓ" ;
(
ÓÓ; <
$str
ÓÓ< k
)
ÓÓk l
;
ÓÓl m
}
ÔÔ 
appointment
ÒÒ 
.
ÒÒ  
Status
ÒÒ  &
=
ÒÒ' (
AppointmentStatus
ÒÒ) :
.
ÒÒ: ;
	Completed
ÒÒ; D
;
ÒÒD E
break
ÚÚ 
;
ÚÚ 
case
ÙÙ 
AppointmentStatus
ÙÙ &
.
ÙÙ& '
	Cancelled
ÙÙ' 0
:
ÙÙ0 1
if
ıı 
(
ıı 
string
ıı 
.
ıı  
IsNullOrWhiteSpace
ıı 1
(
ıı1 2
dto
ıı2 5
.
ıı5 6 
CancellationReason
ıı6 H
)
ııH I
)
ııI J
{
ˆˆ 
throw
˜˜ 
new
˜˜ !
ArgumentException
˜˜" 3
(
˜˜3 4
$str
˜˜4 V
)
˜˜V W
;
˜˜W X
}
¯¯ 
appointment
˙˙ 
.
˙˙  
Status
˙˙  &
=
˙˙' (
AppointmentStatus
˙˙) :
.
˙˙: ;
	Cancelled
˙˙; D
;
˙˙D E
appointment
˚˚ 
.
˚˚   
CancellationReason
˚˚  2
=
˚˚3 4
dto
˚˚5 8
.
˚˚8 9 
CancellationReason
˚˚9 K
.
˚˚K L
Trim
˚˚L P
(
˚˚P Q
)
˚˚Q R
;
˚˚R S/
!shouldInvalidateAvailabilityCache
¸¸ 5
=
¸¸6 7
true
¸¸8 <
;
¸¸< =
break
˝˝ 
;
˝˝ 
default
ˇˇ 
:
ˇˇ 
throw
ÄÄ 
new
ÄÄ 
ArgumentException
ÄÄ /
(
ÄÄ/ 0
$str
ÄÄ0 M
)
ÄÄM N
;
ÄÄN O
}
ÅÅ 
await
ÉÉ $
_appointmentRepository
ÉÉ (
.
ÉÉ( )
UpdateAsync
ÉÉ) 4
(
ÉÉ4 5
appointment
ÉÉ5 @
)
ÉÉ@ A
;
ÉÉA B
await
ÑÑ $
_appointmentRepository
ÑÑ (
.
ÑÑ( )
SaveChangesAsync
ÑÑ) 9
(
ÑÑ9 :
)
ÑÑ: ;
;
ÑÑ; <
if
ÜÜ 
(
ÜÜ /
!shouldInvalidateAvailabilityCache
ÜÜ 1
)
ÜÜ1 2
{
áá 
await
àà 4
&InvalidateDoctorAvailabilityCacheAsync
àà <
(
àà< =
appointment
ââ 
.
ââ  
DoctorId
ââ  (
,
ââ( )
appointment
ää 
.
ää  
ScheduledDate
ää  -
)
ää- .
;
ää. /
}
ãã 
}
åå 	
public
éé 
async
éé 
Task
éé 
ConfirmAsync
éé &
(
éé& '
int
éé' *
id
éé+ -
)
éé- .
{
èè 	
var
êê 
appointment
êê 
=
êê 
await
êê #$
_appointmentRepository
êê$ :
.
êê: ;
GetByIdAsync
êê; G
(
êêG H
id
êêH J
)
êêJ K
;
êêK L
if
íí 
(
íí 
appointment
íí 
==
íí 
null
íí #
)
íí# $
{
ìì 
throw
îî 
new
îî "
KeyNotFoundException
îî .
(
îî. /
)
îî/ 0
;
îî0 1
}
ïï 
if
óó 
(
óó 
appointment
óó 
.
óó 
Status
óó "
!=
óó# %
AppointmentStatus
óó& 7
.
óó7 8
Pending
óó8 ?
)
óó? @
{
òò 
throw
ôô 
new
ôô '
InvalidOperationException
ôô 3
(
ôô3 4
$str
ôô4 a
)
ôôa b
;
ôôb c
}
öö 
appointment
úú 
.
úú 
Status
úú 
=
úú  
AppointmentStatus
úú! 2
.
úú2 3
	Confirmed
úú3 <
;
úú< =
await
ûû $
_appointmentRepository
ûû (
.
ûû( )
UpdateAsync
ûû) 4
(
ûû4 5
appointment
ûû5 @
)
ûû@ A
;
ûûA B
await
üü $
_appointmentRepository
üü (
.
üü( )
SaveChangesAsync
üü) 9
(
üü9 :
)
üü: ;
;
üü; <
}
†† 	
public
¢¢ 
async
¢¢ 
Task
¢¢ 
CompleteAsync
¢¢ '
(
¢¢' (
int
¢¢( +
id
¢¢, .
)
¢¢. /
{
££ 	
var
§§ 
appointment
§§ 
=
§§ 
await
§§ #$
_appointmentRepository
§§$ :
.
§§: ;
GetByIdAsync
§§; G
(
§§G H
id
§§H J
)
§§J K
;
§§K L
if
¶¶ 
(
¶¶ 
appointment
¶¶ 
==
¶¶ 
null
¶¶ #
)
¶¶# $
{
ßß 
throw
®® 
new
®® "
KeyNotFoundException
®® .
(
®®. /
)
®®/ 0
;
®®0 1
}
©© 
if
´´ 
(
´´ 
appointment
´´ 
.
´´ 
Status
´´ "
!=
´´# %
AppointmentStatus
´´& 7
.
´´7 8
	Confirmed
´´8 A
)
´´A B
{
¨¨ 
throw
≠≠ 
new
≠≠ '
InvalidOperationException
≠≠ 3
(
≠≠3 4
$str
≠≠4 c
)
≠≠c d
;
≠≠d e
}
ÆÆ 
appointment
∞∞ 
.
∞∞ 
Status
∞∞ 
=
∞∞  
AppointmentStatus
∞∞! 2
.
∞∞2 3
	Completed
∞∞3 <
;
∞∞< =
await
≤≤ $
_appointmentRepository
≤≤ (
.
≤≤( )
UpdateAsync
≤≤) 4
(
≤≤4 5
appointment
≤≤5 @
)
≤≤@ A
;
≤≤A B
await
≥≥ $
_appointmentRepository
≥≥ (
.
≥≥( )
SaveChangesAsync
≥≥) 9
(
≥≥9 :
)
≥≥: ;
;
≥≥; <
}
¥¥ 	
public
∂∂ 
async
∂∂ 
Task
∂∂ 
CancelAsync
∂∂ %
(
∂∂% &
int
∂∂& )
id
∂∂* ,
,
∂∂, -"
CancelAppointmentDto
∂∂. B
dto
∂∂C F
)
∂∂F G
{
∑∑ 	
var
∏∏ 
appointment
∏∏ 
=
∏∏ 
await
∏∏ #$
_appointmentRepository
∏∏$ :
.
∏∏: ;
GetByIdAsync
∏∏; G
(
∏∏G H
id
∏∏H J
)
∏∏J K
;
∏∏K L
if
∫∫ 
(
∫∫ 
appointment
∫∫ 
==
∫∫ 
null
∫∫ #
)
∫∫# $
{
ªª 
throw
ºº 
new
ºº "
KeyNotFoundException
ºº .
(
ºº. /
)
ºº/ 0
;
ºº0 1
}
ΩΩ 
if
øø 
(
øø 
appointment
øø 
.
øø 
Status
øø "
==
øø# %
AppointmentStatus
øø& 7
.
øø7 8
	Completed
øø8 A
)
øøA B
{
¿¿ 
throw
¡¡ 
new
¡¡ '
InvalidOperationException
¡¡ 3
(
¡¡3 4
$str
¡¡4 a
)
¡¡a b
;
¡¡b c
}
¬¬ 
if
ƒƒ 
(
ƒƒ 
appointment
ƒƒ 
.
ƒƒ 
Status
ƒƒ "
==
ƒƒ# %
AppointmentStatus
ƒƒ& 7
.
ƒƒ7 8
	Cancelled
ƒƒ8 A
)
ƒƒA B
{
≈≈ 
throw
∆∆ 
new
∆∆ '
InvalidOperationException
∆∆ 3
(
∆∆3 4
$str
∆∆4 T
)
∆∆T U
;
∆∆U V
}
«« 
if
…… 
(
…… 
string
…… 
.
……  
IsNullOrWhiteSpace
…… )
(
……) *
dto
……* -
.
……- . 
CancellationReason
……. @
)
……@ A
)
……A B
{
   
throw
ÀÀ 
new
ÀÀ 
ArgumentException
ÀÀ +
(
ÀÀ+ ,
$str
ÀÀ, N
)
ÀÀN O
;
ÀÀO P
}
ÃÃ 
appointment
ŒŒ 
.
ŒŒ 
Status
ŒŒ 
=
ŒŒ  
AppointmentStatus
ŒŒ! 2
.
ŒŒ2 3
	Cancelled
ŒŒ3 <
;
ŒŒ< =
appointment
œœ 
.
œœ  
CancellationReason
œœ *
=
œœ+ ,
dto
œœ- 0
.
œœ0 1 
CancellationReason
œœ1 C
.
œœC D
Trim
œœD H
(
œœH I
)
œœI J
;
œœJ K
await
—— $
_appointmentRepository
—— (
.
——( )
UpdateAsync
——) 4
(
——4 5
appointment
——5 @
)
——@ A
;
——A B
await
““ $
_appointmentRepository
““ (
.
““( )
SaveChangesAsync
““) 9
(
““9 :
)
““: ;
;
““; <
await
‘‘ 4
&InvalidateDoctorAvailabilityCacheAsync
‘‘ 8
(
‘‘8 9
appointment
’’ 
.
’’ 
DoctorId
’’ $
,
’’$ %
appointment
÷÷ 
.
÷÷ 
ScheduledDate
÷÷ )
)
÷÷) *
;
÷÷* +
}
◊◊ 	
public
ŸŸ 
async
ŸŸ 
Task
ŸŸ 
<
ŸŸ 
IEnumerable
ŸŸ %
<
ŸŸ% &#
DoctorScheduleItemDto
ŸŸ& ;
>
ŸŸ; <
>
ŸŸ< =,
GetDoctorUpcomingScheduleAsync
ŸŸ> \
(
ŸŸ\ ]
int
ŸŸ] `
doctorId
ŸŸa i
)
ŸŸi j
{
⁄⁄ 	
var
€€ 
	startDate
€€ 
=
€€ 
DateOnly
€€ $
.
€€$ %
FromDateTime
€€% 1
(
€€1 2
DateTime
€€2 :
.
€€: ;
Today
€€; @
)
€€@ A
;
€€A B
var
‹‹ 
endDate
‹‹ 
=
‹‹ 
	startDate
‹‹ #
.
‹‹# $
AddDays
‹‹$ +
(
‹‹+ ,
$num
‹‹, -
)
‹‹- .
;
‹‹. /
var
ﬁﬁ 
appointments
ﬁﬁ 
=
ﬁﬁ 
await
ﬂﬂ $
_appointmentRepository
ﬂﬂ ,
.
ﬂﬂ, -(
GetDoctorWeekScheduleAsync
ﬂﬂ- G
(
ﬂﬂG H
doctorId
‡‡ 
,
‡‡ 
	startDate
·· 
,
·· 
endDate
‚‚ 
)
‚‚ 
;
‚‚ 
return
‰‰ 
appointments
‰‰ 
.
‰‰  
Select
‰‰  &
(
‰‰& '#
MapDoctorScheduleItem
‰‰' <
)
‰‰< =
;
‰‰= >
}
ÂÂ 	
public
ÁÁ 
async
ÁÁ 
Task
ÁÁ 
<
ÁÁ 
IEnumerable
ÁÁ %
<
ÁÁ% &
DoctorPatientDto
ÁÁ& 6
>
ÁÁ6 7
>
ÁÁ7 8$
GetDoctorPatientsAsync
ÁÁ9 O
(
ÁÁO P
int
ÁÁP S
doctorId
ÁÁT \
)
ÁÁ\ ]
{
ËË 	
var
ÈÈ 
doctor
ÈÈ 
=
ÈÈ 
await
ÈÈ 
_doctorRepository
ÈÈ 0
.
ÈÈ0 1
GetByIdAsync
ÈÈ1 =
(
ÈÈ= >
doctorId
ÈÈ> F
)
ÈÈF G
;
ÈÈG H
if
ÎÎ 
(
ÎÎ 
doctor
ÎÎ 
==
ÎÎ 
null
ÎÎ 
)
ÎÎ 
{
ÏÏ 
throw
ÌÌ 
new
ÌÌ "
KeyNotFoundException
ÌÌ .
(
ÌÌ. /
$"
ÌÌ/ 1
$str
ÌÌ1 @
{
ÌÌ@ A
doctorId
ÌÌA I
}
ÌÌI J
$str
ÌÌJ U
"
ÌÌU V
)
ÌÌV W
;
ÌÌW X
}
ÓÓ 
var
 
appointments
 
=
 
await
ÒÒ $
_appointmentRepository
ÒÒ ,
.
ÒÒ, -/
!GetDoctorPatientAppointmentsAsync
ÒÒ- N
(
ÒÒN O
doctorId
ÒÒO W
)
ÒÒW X
;
ÒÒX Y
var
ÛÛ 
patients
ÛÛ 
=
ÛÛ 
appointments
ÛÛ '
.
ÙÙ 
Where
ÙÙ 
(
ÙÙ 
a
ÙÙ 
=>
ÙÙ 
a
ÙÙ 
.
ÙÙ 
Patient
ÙÙ %
!=
ÙÙ& (
null
ÙÙ) -
)
ÙÙ- .
.
ıı 
GroupBy
ıı 
(
ıı 
a
ıı 
=>
ıı 
a
ıı 
.
ıı  
	PatientId
ıı  )
)
ıı) *
.
ˆˆ 
Select
ˆˆ 
(
ˆˆ 
group
ˆˆ 
=>
ˆˆ  
{
˜˜ 
var
¯¯ 
latestAppointment
¯¯ )
=
¯¯* +
group
¯¯, 1
.
˘˘ 
OrderByDescending
˘˘ *
(
˘˘* +
a
˘˘+ ,
=>
˘˘- /
a
˘˘0 1
.
˘˘1 2
ScheduledDate
˘˘2 ?
)
˘˘? @
.
˙˙ 
ThenByDescending
˙˙ )
(
˙˙) *
a
˙˙* +
=>
˙˙, .
a
˙˙/ 0
.
˙˙0 1
TimeSlot
˙˙1 9
)
˙˙9 :
.
˚˚ 
First
˚˚ 
(
˚˚ 
)
˚˚  
;
˚˚  !
var
˝˝ 
patient
˝˝ 
=
˝˝  !
latestAppointment
˝˝" 3
.
˝˝3 4
Patient
˝˝4 ;
;
˝˝; <
return
ˇˇ 
new
ˇˇ 
DoctorPatientDto
ˇˇ /
{
ÄÄ 
	PatientId
ÅÅ !
=
ÅÅ" #
patient
ÅÅ$ +
.
ÅÅ+ ,
	PatientId
ÅÅ, 5
,
ÅÅ5 6
FullName
ÇÇ  
=
ÇÇ! "
patient
ÇÇ# *
.
ÇÇ* +
FullName
ÇÇ+ 3
,
ÇÇ3 4
DateOfBirth
ÉÉ #
=
ÉÉ$ %
patient
ÉÉ& -
.
ÉÉ- .
DateOfBirth
ÉÉ. 9
,
ÉÉ9 :
Gender
ÑÑ 
=
ÑÑ  
patient
ÑÑ! (
.
ÑÑ( )
Gender
ÑÑ) /
,
ÑÑ/ 0
PhoneNumber
ÖÖ #
=
ÖÖ$ %
patient
ÖÖ& -
.
ÖÖ- .
PhoneNumber
ÖÖ. 9
,
ÖÖ9 :
Email
ÜÜ 
=
ÜÜ 
patient
ÜÜ  '
.
ÜÜ' (
Email
ÜÜ( -
,
ÜÜ- .
InsuranceId
áá #
=
áá$ %
patient
áá& -
.
áá- .
InsuranceNumber
áá. =
,
áá= >
IsActive
àà  
=
àà! "
patient
àà# *
.
àà* +
IsActive
àà+ 3
,
àà3 4
TotalAppointments
ââ )
=
ââ* +
group
ââ, 1
.
ââ1 2
Count
ââ2 7
(
ââ7 8
)
ââ8 9
,
ââ9 :
LastVisitDate
ää %
=
ää& '
latestAppointment
ää( 9
.
ää9 :
ScheduledDate
ää: G
}
ãã 
;
ãã 
}
åå 
)
åå 
.
çç 
OrderBy
çç 
(
çç 
p
çç 
=>
çç 
p
çç 
.
çç  
FullName
çç  (
)
çç( )
.
éé 
ToList
éé 
(
éé 
)
éé 
;
éé 
return
êê 
patients
êê 
;
êê 
}
ëë 	
private
ìì 
async
ìì 
Task
ìì "
ValidateBookingAsync
ìì /
(
ìì/ 0
int
îî 
	patientId
îî 
,
îî 
int
ïï 
doctorId
ïï 
,
ïï 
DateOnly
ññ 
date
ññ 
,
ññ 
int
óó 
timeSlot
óó 
)
óó 
{
òò 	
var
ôô 
patient
ôô 
=
ôô 
await
ôô  
_patientRepository
ôô  2
.
ôô2 3
GetByIdAsync
ôô3 ?
(
ôô? @
	patientId
ôô@ I
)
ôôI J
;
ôôJ K
if
õõ 
(
õõ 
patient
õõ 
==
õõ 
null
õõ 
)
õõ  
{
úú 
throw
ùù 
new
ùù "
KeyNotFoundException
ùù .
(
ùù. /
$str
ùù/ C
)
ùùC D
;
ùùD E
}
ûû 
if
†† 
(
†† 
!
†† 
patient
†† 
.
†† 
IsActive
†† !
)
††! "
{
°° 
throw
¢¢ 
new
¢¢ '
InvalidOperationException
¢¢ 3
(
¢¢3 4
$str
¢¢4 a
)
¢¢a b
;
¢¢b c
}
££ 
var
•• 
doctor
•• 
=
•• 
await
•• 
_doctorRepository
•• 0
.
••0 1
GetByIdAsync
••1 =
(
••= >
doctorId
••> F
)
••F G
;
••G H
if
ßß 
(
ßß 
doctor
ßß 
==
ßß 
null
ßß 
)
ßß 
{
®® 
throw
©© 
new
©© "
KeyNotFoundException
©© .
(
©©. /
$str
©©/ B
)
©©B C
;
©©C D
}
™™ 
if
¨¨ 
(
¨¨ 
!
¨¨ 
doctor
¨¨ 
.
¨¨ 
IsActive
¨¨  
)
¨¨  !
{
≠≠ 
throw
ÆÆ 
new
ÆÆ '
InvalidOperationException
ÆÆ 3
(
ÆÆ3 4
$str
ÆÆ4 F
)
ÆÆF G
;
ÆÆG H
}
ØØ (
ValidateBookingDateAndSlot
±± &
(
±±& '
date
±±' +
,
±±+ ,
timeSlot
±±- 5
)
±±5 6
;
±±6 7
if
≥≥ 
(
≥≥ 
await
≥≥ $
_appointmentRepository
≥≥ ,
.
≥≥, -6
(ExistsSamePatientSameDoctorSameDateAsync
≥≥- U
(
≥≥U V
	patientId
≥≥V _
,
≥≥_ `
doctorId
≥≥a i
,
≥≥i j
date
≥≥k o
)
≥≥o p
)
≥≥p q
{
¥¥ 
throw
µµ 
new
µµ '
InvalidOperationException
µµ 3
(
µµ3 4
$str
µµ4 
)µµ Ä
;µµÄ Å
}
∂∂ 
if
∏∏ 
(
∏∏ 
await
∏∏ $
_appointmentRepository
∏∏ ,
.
∏∏, -4
&ExistsSamePatientSameSlotSameDateAsync
∏∏- S
(
∏∏S T
	patientId
∏∏T ]
,
∏∏] ^
date
∏∏_ c
,
∏∏c d
timeSlot
∏∏e m
)
∏∏m n
)
∏∏n o
{
ππ 
throw
∫∫ 
new
∫∫ '
InvalidOperationException
∫∫ 3
(
∫∫3 4
$str
∫∫4 p
)
∫∫p q
;
∫∫q r
}
ªª 
if
ΩΩ 
(
ΩΩ 
await
ΩΩ $
_appointmentRepository
ΩΩ ,
.
ΩΩ, -3
%ExistsSameDoctorSameSlotSameDateAsync
ΩΩ- R
(
ΩΩR S
doctorId
ΩΩS [
,
ΩΩ[ \
date
ΩΩ] a
,
ΩΩa b
timeSlot
ΩΩc k
)
ΩΩk l
)
ΩΩl m
{
ææ 
throw
øø 
new
øø '
InvalidOperationException
øø 3
(
øø3 4
$str
øø4 b
)
øøb c
;
øøc d
}
¿¿ 
}
¡¡ 	
private
√√ 
async
√√ 
Task
√√ (
ValidateUpdateBookingAsync
√√ 5
(
√√5 6
int
ƒƒ 
appointmentId
ƒƒ 
,
ƒƒ 
int
≈≈ 
	patientId
≈≈ 
,
≈≈ 
int
∆∆ 
doctorId
∆∆ 
,
∆∆ 
DateOnly
«« 
date
«« 
,
«« 
int
»» 
timeSlot
»» 
)
»» 
{
…… 	
var
   
patient
   
=
   
await
    
_patientRepository
    2
.
  2 3
GetByIdAsync
  3 ?
(
  ? @
	patientId
  @ I
)
  I J
;
  J K
if
ÃÃ 
(
ÃÃ 
patient
ÃÃ 
==
ÃÃ 
null
ÃÃ 
)
ÃÃ  
{
ÕÕ 
throw
ŒŒ 
new
ŒŒ "
KeyNotFoundException
ŒŒ .
(
ŒŒ. /
$str
ŒŒ/ C
)
ŒŒC D
;
ŒŒD E
}
œœ 
if
—— 
(
—— 
!
—— 
patient
—— 
.
—— 
IsActive
—— !
)
——! "
{
““ 
throw
”” 
new
”” '
InvalidOperationException
”” 3
(
””3 4
$str
””4 a
)
””a b
;
””b c
}
‘‘ 
var
÷÷ 
doctor
÷÷ 
=
÷÷ 
await
÷÷ 
_doctorRepository
÷÷ 0
.
÷÷0 1
GetByIdAsync
÷÷1 =
(
÷÷= >
doctorId
÷÷> F
)
÷÷F G
;
÷÷G H
if
ÿÿ 
(
ÿÿ 
doctor
ÿÿ 
==
ÿÿ 
null
ÿÿ 
)
ÿÿ 
{
ŸŸ 
throw
⁄⁄ 
new
⁄⁄ "
KeyNotFoundException
⁄⁄ .
(
⁄⁄. /
$str
⁄⁄/ B
)
⁄⁄B C
;
⁄⁄C D
}
€€ 
if
›› 
(
›› 
!
›› 
doctor
›› 
.
›› 
IsActive
››  
)
››  !
{
ﬁﬁ 
throw
ﬂﬂ 
new
ﬂﬂ '
InvalidOperationException
ﬂﬂ 3
(
ﬂﬂ3 4
$str
ﬂﬂ4 F
)
ﬂﬂF G
;
ﬂﬂG H
}
‡‡ (
ValidateBookingDateAndSlot
‚‚ &
(
‚‚& '
date
‚‚' +
,
‚‚+ ,
timeSlot
‚‚- 5
)
‚‚5 6
;
‚‚6 7
if
‰‰ 
(
‰‰ 
await
‰‰ $
_appointmentRepository
‰‰ ,
.
‰‰, -6
(ExistsSamePatientSameDoctorSameDateAsync
‰‰- U
(
‰‰U V
	patientId
‰‰V _
,
‰‰_ `
doctorId
‰‰a i
,
‰‰i j
date
‰‰k o
,
‰‰o p
appointmentId
‰‰q ~
)
‰‰~ 
)‰‰ Ä
{
ÂÂ 
throw
ÊÊ 
new
ÊÊ '
InvalidOperationException
ÊÊ 3
(
ÊÊ3 4
$str
ÊÊ4 
)ÊÊ Ä
;ÊÊÄ Å
}
ÁÁ 
if
ÈÈ 
(
ÈÈ 
await
ÈÈ $
_appointmentRepository
ÈÈ ,
.
ÈÈ, -4
&ExistsSamePatientSameSlotSameDateAsync
ÈÈ- S
(
ÈÈS T
	patientId
ÈÈT ]
,
ÈÈ] ^
date
ÈÈ_ c
,
ÈÈc d
timeSlot
ÈÈe m
,
ÈÈm n
appointmentId
ÈÈo |
)
ÈÈ| }
)
ÈÈ} ~
{
ÍÍ 
throw
ÎÎ 
new
ÎÎ '
InvalidOperationException
ÎÎ 3
(
ÎÎ3 4
$str
ÎÎ4 p
)
ÎÎp q
;
ÎÎq r
}
ÏÏ 
if
ÓÓ 
(
ÓÓ 
await
ÓÓ $
_appointmentRepository
ÓÓ ,
.
ÓÓ, -3
%ExistsSameDoctorSameSlotSameDateAsync
ÓÓ- R
(
ÓÓR S
doctorId
ÓÓS [
,
ÓÓ[ \
date
ÓÓ] a
,
ÓÓa b
timeSlot
ÓÓc k
,
ÓÓk l
appointmentId
ÓÓm z
)
ÓÓz {
)
ÓÓ{ |
{
ÔÔ 
throw
 
new
 '
InvalidOperationException
 3
(
3 4
$str
4 b
)
b c
;
c d
}
ÒÒ 
}
ÚÚ 	
private
ÙÙ 
async
ÙÙ 
Task
ÙÙ 4
&InvalidateDoctorAvailabilityCacheAsync
ÙÙ A
(
ÙÙA B
int
ıı 
doctorId
ıı 
,
ıı 
DateOnly
ˆˆ 
date
ˆˆ 
)
ˆˆ 
{
˜˜ 	
var
¯¯ 
cacheKey
¯¯ 
=
¯¯ '
BuildAvailabilityCacheKey
¯¯ 4
(
¯¯4 5
doctorId
˘˘ 
,
˘˘ 
date
˙˙ 
)
˙˙ 
;
˙˙ 
await
¸¸ 
_cache
¸¸ 
.
¸¸ 
RemoveAsync
¸¸ $
(
¸¸$ %
cacheKey
¸¸% -
)
¸¸- .
;
¸¸. /
_logger
˛˛ 
.
˛˛ 
LogInformation
˛˛ "
(
˛˛" #
$str
ˇˇ o
,
ˇˇo p
doctorId
ÄÄ 
,
ÄÄ 
date
ÅÅ 
,
ÅÅ 
cacheKey
ÇÇ 
)
ÇÇ 
;
ÇÇ 
}
ÉÉ 	
private
ÖÖ 
static
ÖÖ 
string
ÖÖ '
BuildAvailabilityCacheKey
ÖÖ 7
(
ÖÖ7 8
int
ÜÜ 
doctorId
ÜÜ 
,
ÜÜ 
DateOnly
áá 
date
áá 
)
áá 
{
àà 	
return
ââ 
$"
ââ 
$str
ââ 
{
ââ 
doctorId
ââ &
}
ââ& '
$str
ââ' 5
{
ââ5 6
date
ââ6 :
:
ââ: ;
$str
ââ; E
}
ââE F
"
ââF G
;
ââG H
}
ää 	
private
åå 
static
åå 
void
åå (
ValidateBookingDateAndSlot
åå 6
(
åå6 7
DateOnly
åå7 ?
date
åå@ D
,
ååD E
int
ååF I
timeSlot
ååJ R
)
ååR S
{
çç 	
var
éé 
today
éé 
=
éé 
DateOnly
éé  
.
éé  !
FromDateTime
éé! -
(
éé- .
DateTime
éé. 6
.
éé6 7
Today
éé7 <
)
éé< =
;
éé= >
var
èè 
maxBookingDate
èè 
=
èè  
today
èè! &
.
èè& '
AddDays
èè' .
(
èè. /
$num
èè/ 1
)
èè1 2
;
èè2 3
if
ëë 
(
ëë 
date
ëë 
<
ëë 
today
ëë 
)
ëë 
{
íí 
throw
ìì 
new
ìì 
ArgumentException
ìì +
(
ìì+ ,
$str
ìì, U
)
ììU V
;
ììV W
}
îî 
if
ññ 
(
ññ 
date
ññ 
>
ññ 
maxBookingDate
ññ %
)
ññ% &
{
óó 
throw
òò 
new
òò 
ArgumentException
òò +
(
òò+ ,
$str
òò, c
)
òòc d
;
òòd e
}
ôô 
if
õõ 
(
õõ 
!
õõ 
Enum
õõ 
.
õõ 
	IsDefined
õõ 
(
õõ  
typeof
õõ  &
(
õõ& '!
AppointmentTimeSlot
õõ' :
)
õõ: ;
,
õõ; <
timeSlot
õõ= E
)
õõE F
)
õõF G
{
úú 
throw
ùù 
new
ùù 
ArgumentException
ùù +
(
ùù+ ,
$str
ùù, G
)
ùùG H
;
ùùH I
}
ûû 
var
†† 
slotEnum
†† 
=
†† 
(
†† !
AppointmentTimeSlot
†† /
)
††/ 0
timeSlot
††0 8
;
††8 9
if
¢¢ 
(
¢¢ 
date
¢¢ 
==
¢¢ 
today
¢¢ 
)
¢¢ 
{
££ 
var
§§ 
now
§§ 
=
§§ 
TimeOnly
§§ "
.
§§" #
FromDateTime
§§# /
(
§§/ 0
DateTime
§§0 8
.
§§8 9
Now
§§9 <
)
§§< =
;
§§= >
var
•• 
slotStartTime
•• !
=
••" #
GetSlotStartTime
••$ 4
(
••4 5
slotEnum
••5 =
)
••= >
;
••> ?
if
ßß 
(
ßß 
slotStartTime
ßß !
<
ßß" #
now
ßß$ '
)
ßß' (
{
®® 
throw
©© 
new
©© '
InvalidOperationException
©© 7
(
©©7 8
$str
©©8 `
)
©©` a
;
©©a b
}
™™ 
}
´´ 
}
¨¨ 	
private
ÆÆ 
static
ÆÆ 
TimeOnly
ÆÆ 
GetSlotStartTime
ÆÆ  0
(
ÆÆ0 1!
AppointmentTimeSlot
ÆÆ1 D
slot
ÆÆE I
)
ÆÆI J
{
ØØ 	
return
∞∞ 
slot
∞∞ 
switch
∞∞ 
{
±± !
AppointmentTimeSlot
≤≤ #
.
≤≤# $
TenAM
≤≤$ )
=>
≤≤* ,
new
≤≤- 0
TimeOnly
≤≤1 9
(
≤≤9 :
$num
≤≤: <
,
≤≤< =
$num
≤≤> ?
)
≤≤? @
,
≤≤@ A!
AppointmentTimeSlot
≥≥ #
.
≥≥# $
TenThirtyAM
≥≥$ /
=>
≥≥0 2
new
≥≥3 6
TimeOnly
≥≥7 ?
(
≥≥? @
$num
≥≥@ B
,
≥≥B C
$num
≥≥D F
)
≥≥F G
,
≥≥G H!
AppointmentTimeSlot
¥¥ #
.
¥¥# $
ElevenAM
¥¥$ ,
=>
¥¥- /
new
¥¥0 3
TimeOnly
¥¥4 <
(
¥¥< =
$num
¥¥= ?
,
¥¥? @
$num
¥¥A B
)
¥¥B C
,
¥¥C D!
AppointmentTimeSlot
µµ #
.
µµ# $
ElevenThirtyAM
µµ$ 2
=>
µµ3 5
new
µµ6 9
TimeOnly
µµ: B
(
µµB C
$num
µµC E
,
µµE F
$num
µµG I
)
µµI J
,
µµJ K!
AppointmentTimeSlot
∂∂ #
.
∂∂# $
TwelvePM
∂∂$ ,
=>
∂∂- /
new
∂∂0 3
TimeOnly
∂∂4 <
(
∂∂< =
$num
∂∂= ?
,
∂∂? @
$num
∂∂A B
)
∂∂B C
,
∂∂C D!
AppointmentTimeSlot
∑∑ #
.
∑∑# $
TwelveThirtyPM
∑∑$ 2
=>
∑∑3 5
new
∑∑6 9
TimeOnly
∑∑: B
(
∑∑B C
$num
∑∑C E
,
∑∑E F
$num
∑∑G I
)
∑∑I J
,
∑∑J K!
AppointmentTimeSlot
∏∏ #
.
∏∏# $
OnePM
∏∏$ )
=>
∏∏* ,
new
∏∏- 0
TimeOnly
∏∏1 9
(
∏∏9 :
$num
∏∏: <
,
∏∏< =
$num
∏∏> ?
)
∏∏? @
,
∏∏@ A!
AppointmentTimeSlot
ππ #
.
ππ# $
OneThirtyPM
ππ$ /
=>
ππ0 2
new
ππ3 6
TimeOnly
ππ7 ?
(
ππ? @
$num
ππ@ B
,
ππB C
$num
ππD F
)
ππF G
,
ππG H!
AppointmentTimeSlot
∫∫ #
.
∫∫# $
TwoPM
∫∫$ )
=>
∫∫* ,
new
∫∫- 0
TimeOnly
∫∫1 9
(
∫∫9 :
$num
∫∫: <
,
∫∫< =
$num
∫∫> ?
)
∫∫? @
,
∫∫@ A!
AppointmentTimeSlot
ªª #
.
ªª# $
TwoThirtyPM
ªª$ /
=>
ªª0 2
new
ªª3 6
TimeOnly
ªª7 ?
(
ªª? @
$num
ªª@ B
,
ªªB C
$num
ªªD F
)
ªªF G
,
ªªG H!
AppointmentTimeSlot
ºº #
.
ºº# $
ThreePM
ºº$ +
=>
ºº, .
new
ºº/ 2
TimeOnly
ºº3 ;
(
ºº; <
$num
ºº< >
,
ºº> ?
$num
ºº@ A
)
ººA B
,
ººB C!
AppointmentTimeSlot
ΩΩ #
.
ΩΩ# $
ThreeThirtyPM
ΩΩ$ 1
=>
ΩΩ2 4
new
ΩΩ5 8
TimeOnly
ΩΩ9 A
(
ΩΩA B
$num
ΩΩB D
,
ΩΩD E
$num
ΩΩF H
)
ΩΩH I
,
ΩΩI J
_
ææ 
=>
ææ 
TimeOnly
ææ 
.
ææ 
MinValue
ææ &
}
øø 
;
øø 
}
¿¿ 	
private
¬¬ 
static
¬¬ 
AppointmentDto
¬¬ %!
MapToAppointmentDto
¬¬& 9
(
¬¬9 :
Appointment
¬¬: E
appointment
¬¬F Q
)
¬¬Q R
{
√√ 	
return
ƒƒ 
new
ƒƒ 
AppointmentDto
ƒƒ %
{
≈≈ 
AppointmentId
∆∆ 
=
∆∆ 
appointment
∆∆  +
.
∆∆+ ,
AppointmentId
∆∆, 9
,
∆∆9 :
	PatientId
«« 
=
«« 
appointment
«« '
.
««' (
	PatientId
««( 1
,
««1 2
DoctorId
»» 
=
»» 
appointment
»» &
.
»»& '
DoctorId
»»' /
,
»»/ 0
ScheduledDate
…… 
=
…… 
appointment
……  +
.
……+ ,
ScheduledDate
……, 9
,
……9 :
TimeSlot
   
=
   
(
   
int
   
)
    
appointment
    +
.
  + ,
TimeSlot
  , 4
,
  4 5
Status
ÀÀ 
=
ÀÀ 
(
ÀÀ 
int
ÀÀ 
)
ÀÀ 
appointment
ÀÀ )
.
ÀÀ) *
Status
ÀÀ* 0
,
ÀÀ0 1 
CancellationReason
ÃÃ "
=
ÃÃ# $
appointment
ÃÃ% 0
.
ÃÃ0 1 
CancellationReason
ÃÃ1 C
}
ÕÕ 
;
ÕÕ 
}
ŒŒ 	
private
–– 
static
–– #
AppointmentDetailsDto
–– ,(
MapToAppointmentDetailsDto
––- G
(
––G H
Appointment
––H S
appointment
––T _
)
––_ `
{
—— 	
return
““ 
new
““ #
AppointmentDetailsDto
““ ,
{
”” 
AppointmentId
‘‘ 
=
‘‘ 
appointment
‘‘  +
.
‘‘+ ,
AppointmentId
‘‘, 9
,
‘‘9 :
	PatientId
’’ 
=
’’ 
appointment
’’ '
.
’’' (
	PatientId
’’( 1
,
’’1 2
PatientName
÷÷ 
=
÷÷ 
appointment
÷÷ )
.
÷÷) *
Patient
÷÷* 1
?
÷÷1 2
.
÷÷2 3
FullName
÷÷3 ;
??
÷÷< >
string
÷÷? E
.
÷÷E F
Empty
÷÷F K
,
÷÷K L
DoctorId
◊◊ 
=
◊◊ 
appointment
◊◊ &
.
◊◊& '
DoctorId
◊◊' /
,
◊◊/ 0

DoctorName
ÿÿ 
=
ÿÿ 
appointment
ÿÿ (
.
ÿÿ( )
Doctor
ÿÿ) /
?
ÿÿ/ 0
.
ÿÿ0 1
FullName
ÿÿ1 9
??
ÿÿ: <
string
ÿÿ= C
.
ÿÿC D
Empty
ÿÿD I
,
ÿÿI J
ScheduledDate
ŸŸ 
=
ŸŸ 
appointment
ŸŸ  +
.
ŸŸ+ ,
ScheduledDate
ŸŸ, 9
,
ŸŸ9 :
TimeSlot
⁄⁄ 
=
⁄⁄ 
(
⁄⁄ 
int
⁄⁄ 
)
⁄⁄  
appointment
⁄⁄  +
.
⁄⁄+ ,
TimeSlot
⁄⁄, 4
,
⁄⁄4 5
Status
€€ 
=
€€ 
(
€€ 
int
€€ 
)
€€ 
appointment
€€ )
.
€€) *
Status
€€* 0
,
€€0 1 
CancellationReason
‹‹ "
=
‹‹# $
appointment
‹‹% 0
.
‹‹0 1 
CancellationReason
‹‹1 C
}
›› 
;
›› 
}
ﬁﬁ 	
private
‡‡ 
static
‡‡ #
DoctorScheduleItemDto
‡‡ ,#
MapDoctorScheduleItem
‡‡- B
(
‡‡B C
Appointment
‡‡C N
appointment
‡‡O Z
)
‡‡Z [
{
·· 	
return
‚‚ 
new
‚‚ #
DoctorScheduleItemDto
‚‚ ,
{
„„ 
AppointmentId
‰‰ 
=
‰‰ 
appointment
‰‰  +
.
‰‰+ ,
AppointmentId
‰‰, 9
,
‰‰9 :
ScheduledDate
ÂÂ 
=
ÂÂ 
appointment
ÂÂ  +
.
ÂÂ+ ,
ScheduledDate
ÂÂ, 9
,
ÂÂ9 :
TimeSlot
ÊÊ 
=
ÊÊ 
(
ÊÊ 
int
ÊÊ 
)
ÊÊ  
appointment
ÊÊ  +
.
ÊÊ+ ,
TimeSlot
ÊÊ, 4
,
ÊÊ4 5
	PatientId
ÁÁ 
=
ÁÁ 
appointment
ÁÁ '
.
ÁÁ' (
	PatientId
ÁÁ( 1
,
ÁÁ1 2
PatientName
ËË 
=
ËË 
appointment
ËË )
.
ËË) *
Patient
ËË* 1
.
ËË1 2
FullName
ËË2 :
,
ËË: ;
Status
ÈÈ 
=
ÈÈ 
(
ÈÈ 
int
ÈÈ 
)
ÈÈ 
appointment
ÈÈ )
.
ÈÈ) *
Status
ÈÈ* 0
,
ÈÈ0 1 
CancellationReason
ÍÍ "
=
ÍÍ# $
appointment
ÍÍ% 0
.
ÍÍ0 1 
CancellationReason
ÍÍ1 C
,
ÍÍC D
HasHealthRecord
ÎÎ 
=
ÎÎ  !
appointment
ÎÎ" -
.
ÎÎ- .
HealthRecord
ÎÎ. :
!=
ÎÎ; =
null
ÎÎ> B
}
ÏÏ 
;
ÏÏ 
}
ÌÌ 	
}
ÓÓ 
}ÔÔ ê3
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
}@@ §!
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
};; ˛@
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
}aa Òï
IC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder 
. 
Host 
. 

UseSerilog 
( 
( 
context  
,  !
services" *
,* +
configuration, 9
)9 :
=>; =
{ 
var 
elasticSection 
= 
context  
.  !
Configuration! .
.. /

GetSection/ 9
(9 :
$str: I
)I J
;J K
var 
elasticEnabled 
= 
bool 
. 
TryParse 
( 
elasticSection $
[$ %
$str% .
]. /
,/ 0
out1 4
var5 8
enabled9 @
)@ A
&&B D
enabled   
;   
var"" 

elasticUri"" 
="" 
elasticSection"" #
[""# $
$str""$ )
]"") *
;""* +
var## 
dataStreamDataset## 
=## 
elasticSection$$ 
[$$ 
$str$$ *
]$$* +
??$$, .
$str$$/ ?
;$$? @
var&& 
dataStreamNamespace&& 
=&& 
elasticSection'' 
['' 
$str'' ,
]'', -
??''. 0
$str''1 8
;''8 9
configuration)) 
.** 	
ReadFrom**	 
.** 
Configuration** 
(**  
context**  '
.**' (
Configuration**( 5
)**5 6
.++ 	
ReadFrom++	 
.++ 
Services++ 
(++ 
services++ #
)++# $
.,, 	
Enrich,,	 
.,, 
FromLogContext,, 
(,, 
),,  
.-- 	
Enrich--	 
.-- 
WithProperty-- 
(-- 
$str-- *
,--* +
$str--, >
)--> ?
... 	
WriteTo..	 
... 
Console.. 
(.. 
).. 
.// 	
WriteTo//	 
.// 
File// 
(// 
$str00 "
,00" #
rollingInterval11 
:11 
RollingInterval11 ,
.11, -
Day11- 0
,110 1"
retainedFileCountLimit22 "
:22" #
$num22$ %
)22% &
;22& '
if44 
(44 
elasticEnabled44 
&&44 
!55 	
string55	 
.55 
IsNullOrWhiteSpace55 "
(55" #

elasticUri55# -
)55- .
)55. /
{66 
configuration77 
.77 
WriteTo77 
.77 
Elasticsearch77 +
(77+ ,
new88 
[88 
]88 
{88 
new88 
Uri88 
(88 

elasticUri88 &
)88& '
}88( )
,88) *
options99 
=>99 
{:: 
options;; 
.;; 

DataStream;; "
=;;# $
new<< 
DataStreamName<< &
(<<& '
$str== 
,== 
dataStreamDataset>> )
,>>) *
dataStreamNamespace?? +
)??+ ,
;??, -
optionsAA 
.AA 
BootstrapMethodAA '
=AA( )
BootstrapMethodBB #
.BB# $
SilentBB$ *
;BB* +
}CC 
)CC 
;CC 
}DD 
}EE 
)EE 
;EE 
builderII 
.II 
ServicesII 
.II 
AddControllersII 
(II  
)II  !
.JJ 
AddJsonOptionsJJ 
(JJ 
optionsJJ 
=>JJ 
{KK 
optionsLL 
.LL !
JsonSerializerOptionsLL %
.LL% & 
PropertyNamingPolicyLL& :
=LL; <
JsonNamingPolicyMM 
.MM 
	CamelCaseMM &
;MM& '
}NN 
)NN 
;NN 
builderTT 
.TT 
ServicesTT 
.TT #
AddEndpointsApiExplorerTT (
(TT( )
)TT) *
;TT* +
builderVV 
.VV 
ServicesVV 
.VV 
AddSwaggerGenVV 
(VV 
optionsVV &
=>VV' )
{WW 
optionsXX 
.XX 

SwaggerDocXX 
(XX 
$strYY 
,YY 
newZZ 
OpenApiInfoZZ 
{[[ 	
Title\\ 
=\\ 
$str\\ $
,\\$ %
Version]] 
=]] 
$str]] 
,]] 
Description^^ 
=^^ 
$str^^ A
}__ 	
)__	 

;__
 
optionsaa 
.aa !
AddSecurityDefinitionaa !
(aa! "
$strbb 
,bb 
newcc !
OpenApiSecuritySchemecc !
{dd 	
Nameee 
=ee 
$stree "
,ee" #
Inff 
=ff 
ParameterLocationff "
.ff" #
Headerff# )
,ff) *
Typegg 
=gg 
SecuritySchemeTypegg %
.gg% &
Httpgg& *
,gg* +
Schemehh 
=hh 
$strhh 
,hh 
BearerFormatii 
=ii 
$strii  
,ii  !
Descriptionjj 
=jj 
$strjj W
}kk 	
)kk	 

;kk
 
optionsmm 
.mm "
AddSecurityRequirementmm "
(mm" #
documentmm# +
=>mm, .
newnn &
OpenApiSecurityRequirementnn &
{oo 	
[pp 
newpp *
OpenApiSecuritySchemeReferencepp /
(pp/ 0
$strqq 
,qq 
documentrr 
)rr 
]rr 
=rr 
[rr 
]rr 
}ss 	
)ss	 

;ss
 
}tt 
)tt 
;tt 
builderzz 
.zz 
Serviceszz 
.zz 
AddDbContextzz 
<zz 
HealthAxisDbContextzz 1
>zz1 2
(zz2 3
optionszz3 :
=>zz; =
{{{ 
options|| 
.|| 
UseSqlServer|| 
(|| 
builder}} 
.}} 
Configuration}} 
.}} 
GetConnectionString}} 1
(}}1 2
$str}}2 E
)}}E F
)}}F G
;}}G H
}~~ 
)~~ 
;~~ 
builderÑÑ 
.
ÑÑ 
Services
ÑÑ 
.
ÑÑ (
AddStackExchangeRedisCache
ÑÑ +
(
ÑÑ+ ,
options
ÑÑ, 3
=>
ÑÑ4 6
{ÖÖ 
options
ÜÜ 
.
ÜÜ 
Configuration
ÜÜ 
=
ÜÜ 
builder
áá 
.
áá 
Configuration
áá 
.
áá 

GetSection
áá (
(
áá( )
$str
áá) 1
)
áá1 2
[
áá2 3
$str
áá3 E
]
ááE F
;
ááF G
options
ââ 
.
ââ 
InstanceName
ââ 
=
ââ 
builder
ää 
.
ää 
Configuration
ää 
.
ää 

GetSection
ää (
(
ää( )
$str
ää) 1
)
ää1 2
[
ää2 3
$str
ää3 A
]
ääA B
??
ääC E
$str
ääF S
;
ääS T
}ãã 
)
ãã 
;
ãã 
builderëë 
.
ëë 
Services
ëë 
.
ëë 
AddAuthentication
ëë "
(
ëë" #
JwtBearerDefaults
íí 
.
íí "
AuthenticationScheme
íí *
)
íí* +
.
ìì 
AddJwtBearer
ìì 
(
ìì 
options
ìì 
=>
ìì 
{
îî 
var
ïï 
jwt
ïï 
=
ïï 
builder
ïï 
.
ïï 
Configuration
ïï '
.
ïï' (

GetSection
ïï( 2
(
ïï2 3
$str
ïï3 8
)
ïï8 9
;
ïï9 :
options
óó 
.
óó '
TokenValidationParameters
óó )
=
óó* +
new
òò '
TokenValidationParameters
òò )
{
ôô 
ValidateIssuer
öö 
=
öö  
true
öö! %
,
öö% &
ValidIssuer
õõ 
=
õõ 
jwt
õõ !
[
õõ! "
$str
õõ" *
]
õõ* +
,
õõ+ ,
ValidateAudience
ùù  
=
ùù! "
true
ùù# '
,
ùù' (
ValidAudience
ûû 
=
ûû 
jwt
ûû  #
[
ûû# $
$str
ûû$ .
]
ûû. /
,
ûû/ 0
ValidateLifetime
††  
=
††! "
true
††# '
,
††' (&
ValidateIssuerSigningKey
¢¢ (
=
¢¢) *
true
¢¢+ /
,
¢¢/ 0
IssuerSigningKey
§§  
=
§§! "
new
•• "
SymmetricSecurityKey
•• ,
(
••, -
Encoding
¶¶  
.
¶¶  !
UTF8
¶¶! %
.
¶¶% &
GetBytes
¶¶& .
(
¶¶. /
jwt
¶¶/ 2
[
¶¶2 3
$str
¶¶3 8
]
¶¶8 9
!
¶¶9 :
)
¶¶: ;
)
¶¶; <
,
¶¶< =
	ClockSkew
®® 
=
®® 
TimeSpan
®® $
.
®®$ %
Zero
®®% )
}
©© 
;
©© 
}
™™ 
)
™™ 
;
™™ 
builder¨¨ 
.
¨¨ 
Services
¨¨ 
.
¨¨ 
AddAuthorization
¨¨ !
(
¨¨! "
)
¨¨" #
;
¨¨# $
builder≤≤ 
.
≤≤ 
Services
≤≤ 
.
≤≤ 
AddCors
≤≤ 
(
≤≤ 
options
≤≤  
=>
≤≤! #
{≥≥ 
options
¥¥ 
.
¥¥ 
	AddPolicy
¥¥ 
(
¥¥ 
$str
µµ 
,
µµ 
policy
∂∂ 
=>
∂∂ 
{
∑∑ 	
policy
∏∏ 
.
ππ 
WithOrigins
ππ 
(
ππ 
$str
∫∫ ,
,
∫∫, -
$str
ªª +
)
ºº 
.
ΩΩ 
AllowAnyHeader
ΩΩ 
(
ΩΩ  
)
ΩΩ  !
.
ææ 
AllowAnyMethod
ææ 
(
ææ  
)
ææ  !
;
ææ! "
}
øø 	
)
øø	 

;
øø
 
}¿¿ 
)
¿¿ 
;
¿¿ 
builder∆∆ 
.
∆∆ 
Services
∆∆ 
.
∆∆ 
	AddScoped
∆∆ 
<
∆∆  
IPatientRepository
∆∆ -
,
∆∆- .
PatientRepository
∆∆/ @
>
∆∆@ A
(
∆∆A B
)
∆∆B C
;
∆∆C D
builder«« 
.
«« 
Services
«« 
.
«« 
	AddScoped
«« 
<
«« 
IDoctorRepository
«« ,
,
««, -
DoctorRepository
««. >
>
««> ?
(
««? @
)
««@ A
;
««A B
builder»» 
.
»» 
Services
»» 
.
»» 
	AddScoped
»» 
<
»» $
IAppointmentRepository
»» 1
,
»»1 2#
AppointmentRepository
»»3 H
>
»»H I
(
»»I J
)
»»J K
;
»»K L
builder…… 
.
…… 
Services
…… 
.
…… 
	AddScoped
…… 
<
…… %
IHealthRecordRepository
…… 2
,
……2 3$
HealthRecordRepository
……4 J
>
……J K
(
……K L
)
……L M
;
……M N
builder   
.
   
Services
   
.
   
	AddScoped
   
<
   
IUserRepository
   *
,
  * +
UserRepository
  , :
>
  : ;
(
  ; <
)
  < =
;
  = >
builderÀÀ 
.
ÀÀ 
Services
ÀÀ 
.
ÀÀ 
	AddScoped
ÀÀ 
<
ÀÀ 
IAdminRepository
ÀÀ +
,
ÀÀ+ ,
AdminRepository
ÀÀ- <
>
ÀÀ< =
(
ÀÀ= >
)
ÀÀ> ?
;
ÀÀ? @
builderÃÃ 
.
ÃÃ 
Services
ÃÃ 
.
ÃÃ 
	AddScoped
ÃÃ 
<
ÃÃ 
IPasswordHasher
ÃÃ *
<
ÃÃ* +
User
ÃÃ+ /
>
ÃÃ/ 0
,
ÃÃ0 1
PasswordHasher
ÃÃ2 @
<
ÃÃ@ A
User
ÃÃA E
>
ÃÃE F
>
ÃÃF G
(
ÃÃG H
)
ÃÃH I
;
ÃÃI J
builder““ 
.
““ 
Services
““ 
.
““ 
	AddScoped
““ 
<
““ 
IPatientService
““ *
,
““* +
PatientService
““, :
>
““: ;
(
““; <
)
““< =
;
““= >
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
IDoctorService
”” )
,
””) *
DoctorService
””+ 8
>
””8 9
(
””9 :
)
””: ;
;
””; <
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
‘‘ !
IAppointmentService
‘‘ .
,
‘‘. / 
AppointmentService
‘‘0 B
>
‘‘B C
(
‘‘C D
)
‘‘D E
;
‘‘E F
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
’’ "
IHealthRecordService
’’ /
,
’’/ 0!
HealthRecordService
’’1 D
>
’’D E
(
’’E F
)
’’F G
;
’’G H
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
÷÷ 
IAuthService
÷÷ '
,
÷÷' (
AuthService
÷÷) 4
>
÷÷4 5
(
÷÷5 6
)
÷÷6 7
;
÷÷7 8
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
◊◊ 
IAdminService
◊◊ (
,
◊◊( )
AdminService
◊◊* 6
>
◊◊6 7
(
◊◊7 8
)
◊◊8 9
;
◊◊9 :
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
ÿÿ 
IUserService
ÿÿ '
,
ÿÿ' (
UserService
ÿÿ) 4
>
ÿÿ4 5
(
ÿÿ5 6
)
ÿÿ6 7
;
ÿÿ7 8
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
IRabbitMqPublisher
ŸŸ -
,
ŸŸ- .
RabbitMqPublisher
ŸŸ/ @
>
ŸŸ@ A
(
ŸŸA B
)
ŸŸB C
;
ŸŸC D
builderﬂﬂ 
.
ﬂﬂ 
Services
ﬂﬂ 
.
ﬂﬂ 
AddHostedService
ﬂﬂ !
<
ﬂﬂ! "
HeartbeatService
ﬂﬂ" 2
>
ﬂﬂ2 3
(
ﬂﬂ3 4
)
ﬂﬂ4 5
;
ﬂﬂ5 6
builder‡‡ 
.
‡‡ 
Services
‡‡ 
.
‡‡ 
AddHostedService
‡‡ !
<
‡‡! "(
NotificationCleanupService
‡‡" <
>
‡‡< =
(
‡‡= >
)
‡‡> ?
;
‡‡? @
builder·· 
.
·· 
Services
·· 
.
·· 
AddHostedService
·· !
<
··! "+
AppointmentMaintenanceService
··" ?
>
··? @
(
··@ A
)
··A B
;
··B C
builderÁÁ 
.
ÁÁ 
Services
ÁÁ 
.
ÁÁ 
AddMassTransit
ÁÁ 
(
ÁÁ  
options
ÁÁ  '
=>
ÁÁ( *
{ËË 
options
ÈÈ 
.
ÈÈ 
AddConsumer
ÈÈ 
<
ÈÈ '
AppointmentBookedConsumer
ÈÈ 1
>
ÈÈ1 2
(
ÈÈ2 3
)
ÈÈ3 4
;
ÈÈ4 5
options
ÎÎ 
.
ÎÎ 
UsingRabbitMq
ÎÎ 
(
ÎÎ 
(
ÎÎ 
context
ÎÎ "
,
ÎÎ" #
cfg
ÎÎ$ '
)
ÎÎ' (
=>
ÎÎ) +
{
ÏÏ 
cfg
ÌÌ 
.
ÌÌ 
Host
ÌÌ 
(
ÌÌ 
$str
ÌÌ 
,
ÌÌ 
$str
ÌÌ !
,
ÌÌ! "
host
ÌÌ# '
=>
ÌÌ( *
{
ÓÓ 	
host
ÔÔ 
.
ÔÔ 
Username
ÔÔ 
(
ÔÔ 
$str
ÔÔ !
)
ÔÔ! "
;
ÔÔ" #
host
 
.
 
Password
 
(
 
$str
 !
)
! "
;
" #
}
ÒÒ 	
)
ÒÒ	 

;
ÒÒ
 
cfg
ÛÛ 
.
ÛÛ 
ReceiveEndpoint
ÛÛ 
(
ÛÛ 
$str
ÛÛ 6
,
ÛÛ6 7
endpoint
ÛÛ8 @
=>
ÛÛA C
{
ÙÙ 	
endpoint
ıı 
.
ıı 
ConfigureConsumer
ıı &
<
ıı& ''
AppointmentBookedConsumer
ıı' @
>
ıı@ A
(
ııA B
context
ııB I
)
ııI J
;
ııJ K
}
ˆˆ 	
)
ˆˆ	 

;
ˆˆ
 
}
˜˜ 
)
˜˜ 
;
˜˜ 
}¯¯ 
)
¯¯ 
;
¯¯ 
var¸¸ 
app
¸¸ 
=
¸¸ 	
builder
¸¸
 
.
¸¸ 
Build
¸¸ 
(
¸¸ 
)
¸¸ 
;
¸¸ 
ifÄÄ 
(
ÄÄ 
app
ÄÄ 
.
ÄÄ 
Environment
ÄÄ 
.
ÄÄ 
IsDevelopment
ÄÄ !
(
ÄÄ! "
)
ÄÄ" #
)
ÄÄ# $
{ÅÅ 
app
ÇÇ 
.
ÇÇ 

UseSwagger
ÇÇ 
(
ÇÇ 
)
ÇÇ 
;
ÇÇ 
app
ÑÑ 
.
ÑÑ 
UseSwaggerUI
ÑÑ 
(
ÑÑ 
options
ÑÑ 
=>
ÑÑ 
{
ÖÖ 
options
ÜÜ 
.
ÜÜ 
SwaggerEndpoint
ÜÜ 
(
ÜÜ  
$str
áá &
,
áá& '
$str
àà 
)
àà  
;
àà  !
options
ää 
.
ää 
RoutePrefix
ää 
=
ää 
string
ää $
.
ää$ %
Empty
ää% *
;
ää* +
}
ãã 
)
ãã 
;
ãã 
}åå 
appéé 
.
éé &
UseSerilogRequestLogging
éé 
(
éé 
)
éé 
;
éé 
appêê 
.
êê 
UseMiddleware
êê 
<
êê !
ExceptionMiddleware
êê %
>
êê% &
(
êê& '
)
êê' (
;
êê( )
appíí 
.
íí !
UseHttpsRedirection
íí 
(
íí 
)
íí 
;
íí 
appîî 
.
îî 
UseCors
îî 
(
îî 
$str
îî 
)
îî 
;
îî 
appññ 
.
ññ 
UseAuthentication
ññ 
(
ññ 
)
ññ 
;
ññ 
appòò 
.
òò 
UseAuthorization
òò 
(
òò 
)
òò 
;
òò 
appöö 
.
öö 
MapControllers
öö 
(
öö 
)
öö 
;
öö 
awaitûû 
app
ûû 	
.
ûû	 

RunAsync
ûû
 
(
ûû 
)
ûû 
;
ûû Ú
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
}?? ·
eC:\Users\287766\source\repos\S4_HealthAxisApp\S4_HealthAxisApi\Consumers\AppointmentBookedConsumer.cs
	namespace 	
S4_HealthAxisApi
 
. 
	Consumers $
{ 
public 

class %
AppointmentBookedConsumer *
:+ ,
	IConsumer- 6
<6 7"
AppointmentBookedEvent7 M
>M N
{		 
private

 
readonly

 
HealthAxisDbContext

 ,

_dbContext

- 7
;

7 8
private 
readonly 
ILogger  
<  !%
AppointmentBookedConsumer! :
>: ;
_logger< C
;C D
public %
AppointmentBookedConsumer (
(( )
HealthAxisDbContext 
	dbContext  )
,) *
ILogger 
< %
AppointmentBookedConsumer -
>- .
logger/ 5
)5 6
{ 	

_dbContext 
= 
	dbContext "
;" #
_logger 
= 
logger 
; 
} 	
public 
async 
Task 
Consume !
(! "
ConsumeContext" 0
<0 1"
AppointmentBookedEvent1 G
>G H
contextI P
)P Q
{ 	
var 
appointmentEvent  
=! "
context# *
.* +
Message+ 2
;2 3
var 
notification 
= 
new "
Notification# /
{ 
DoctorId 
= 
appointmentEvent +
.+ ,
DoctorId, 4
,4 5
AppointmentId 
= 
appointmentEvent  0
.0 1
AppointmentId1 >
,> ?
Message 
= 
$" 
$str 1
{1 2
appointmentEvent2 B
.B C
PatientNameC N
}N O
$strO Q
"Q R
+S T
$" 
$str #
{# $
appointmentEvent$ 4
.4 5
AppointmentId5 B
}B C
$strC T
"T U
+V W
$"   
{   
appointmentEvent   '
.  ' (
ScheduledDate  ( 5
:  5 6
$str  6 A
}  A B
$str  B F
{  F G
appointmentEvent  G W
.  W X
TimeSlot  X `
}  ` a
$str  a b
"  b c
,  c d
IsRead!! 
=!! 
false!! 
,!! 
	CreatedOn"" 
="" 
DateTime"" $
.""$ %
UtcNow""% +
}## 
;## 
await%% 

_dbContext%% 
.%% 
Notifications%% *
.%%* +
AddAsync%%+ 3
(%%3 4
notification&& 
,&& 
context'' 
.'' 
CancellationToken'' )
)'') *
;''* +
await)) 

_dbContext)) 
.)) 
SaveChangesAsync)) -
())- .
context)). 5
.))5 6
CancellationToken))6 G
)))G H
;))H I
_logger++ 
.++ 
LogInformation++ "
(++" #
$str	,, •
,
,,• ¶
notification-- 
.-- 
NotificationId-- +
,--+ ,
appointmentEvent..  
...  !
DoctorId..! )
,..) *
appointmentEvent//  
.//  !
AppointmentId//! .
)//. /
;/// 0
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
$numR T
)T U
;U V
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
}.. ˝}
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
TimeSpan

? G
.

G H
	FromHours

H Q
(

Q R
$num

R T
)

T U
;

U V
private 
const 
string )
PendingAutoCancellationReason :
=; <
$str N
;N O
private 
const 
string +
ConfirmedAutoCancellationReason <
== >
$str n
;n o
private 
readonly 
ILogger  
<  !)
AppointmentMaintenanceService! >
>> ?
_logger@ G
;G H
private 
readonly  
IServiceScopeFactory - 
_serviceScopeFactory. B
;B C
public )
AppointmentMaintenanceService ,
(, -
ILogger 
< )
AppointmentMaintenanceService 1
>1 2
logger3 9
,9 : 
IServiceScopeFactory  
serviceScopeFactory! 4
)4 5
{ 	
_logger 
= 
logger 
;  
_serviceScopeFactory  
=! "
serviceScopeFactory# 6
;6 7
} 	
	protected 
override 
async  
Task! %
ExecuteAsync& 2
(2 3
CancellationToken3 D
stoppingTokenE R
)R S
{ 	
_logger 
. 
LogInformation "
(" #
$str# K
)K L
;L M
try!! 
{"" 
while## 
(## 
!## 
stoppingToken## %
.##% &#
IsCancellationRequested##& =
)##= >
{$$ 
await%% 
RunMaintenanceAsync%% -
(%%- .
stoppingToken%%. ;
)%%; <
;%%< =
await'' 
Task'' 
.'' 
Delay'' $
(''$ %
MaintenanceInterval''% 8
,''8 9
stoppingToken'': G
)''G H
;''H I
}(( 
})) 
catch** 
(** &
OperationCanceledException** -
)**- .
when**/ 3
(**4 5
stoppingToken**5 B
.**B C#
IsCancellationRequested**C Z
)**Z [
{++ 
_logger,, 
.,, 
LogInformation,, &
(,,& '
$str,,' ^
),,^ _
;,,_ `
}-- 
finally.. 
{// 
_logger00 
.00 
LogInformation00 &
(00& '
$str00' O
)00O P
;00P Q
}11 
}22 	
private44 
async44 
Task44 
RunMaintenanceAsync44 .
(44. /
CancellationToken44/ @
cancellationToken44A R
)44R S
{55 	
try66 
{77 
using88 
var88 
scope88 
=88  ! 
_serviceScopeFactory88" 6
.886 7
CreateScope887 B
(88B C
)88C D
;88D E
var:: 
	dbContext:: 
=:: 
scope;; 
.;; 
ServiceProvider;; )
.;;) *
GetRequiredService;;* <
<;;< =
HealthAxisDbContext;;= P
>;;P Q
(;;Q R
);;R S
;;;S T
var== 
cache== 
=== 
scope>> 
.>> 
ServiceProvider>> )
.>>) *
GetRequiredService>>* <
<>>< =
IDistributedCache>>= N
>>>N O
(>>O P
)>>P Q
;>>Q R
var@@ 
today@@ 
=@@ 
DateOnlyAA 
.AA 
FromDateTimeAA )
(AA) *
DateTimeAA* 2
.AA2 3
TodayAA3 8
)AA8 9
;AA9 :
varCC )
affectedAvailabilityCacheKeysCC 1
=CC2 3
awaitDD .
"AutoCancelOverdueAppointmentsAsyncDD <
(DD< =
	dbContextEE !
,EE! "
todayFF 
,FF 
cancellationTokenGG )
)GG) *
;GG* +
ifII 
(II )
affectedAvailabilityCacheKeysII 1
.II1 2
CountII2 7
>II8 9
$numII: ;
)II; <
{JJ 
awaitKK -
!InvalidateAvailabilityCachesAsyncKK ;
(KK; <
cacheLL 
,LL )
affectedAvailabilityCacheKeysMM 5
,MM5 6
cancellationTokenNN )
)NN) *
;NN* +
}OO 
ifQQ 
(QQ 
todayQQ 
.QQ 
DayQQ 
==QQ  
$numQQ! "
)QQ" #
{RR 
awaitSS /
#DeleteOldCancelledAppointmentsAsyncSS =
(SS= >
	dbContextTT !
,TT! "
todayUU 
,UU 
cancellationTokenVV )
)VV) *
;VV* +
}WW 
_loggerYY 
.YY 
LogInformationYY &
(YY& '
$strZZ G
,ZZG H
DateTimeOffset[[ "
.[[" #
Now[[# &
)[[& '
;[[' (
}\\ 
catch]] 
(]] 
	Exception]] 
ex]] 
)]]  
{^^ 
_logger__ 
.__ 
LogError__  
(__  !
ex`` 
,`` 
$straa D
,aaD E
DateTimeOffsetbb "
.bb" #
Nowbb# &
)bb& '
;bb' (
}cc 
}dd 	
privateff 
asyncff 
Taskff 
<ff 
HashSetff "
<ff" #
stringff# )
>ff) *
>ff* +.
"AutoCancelOverdueAppointmentsAsyncff, N
(ffN O
HealthAxisDbContextgg 
	dbContextgg  )
,gg) *
DateOnlyhh 
todayhh 
,hh 
CancellationTokenii 
cancellationTokenii /
)ii/ 0
{jj 	
varkk 
affectedCacheKeyskk !
=kk" #
newkk$ '
HashSetkk( /
<kk/ 0
stringkk0 6
>kk6 7
(kk7 8
)kk8 9
;kk9 :
varmm 
overdueAppointmentsmm #
=mm$ %
awaitmm& +
	dbContextmm, 5
.mm5 6
Appointmentsmm6 B
.nn 
Wherenn 
(nn 
appointmentnn "
=>nn# %
appointmentoo 
.oo  
ScheduledDateoo  -
<oo. /
todayoo0 5
&&oo6 8
(pp 
appointmentqq #
.qq# $
Statusqq$ *
==qq+ -
AppointmentStatusqq. ?
.qq? @
Pendingqq@ G
||qqH J
appointmentrr #
.rr# $
Statusrr$ *
==rr+ -
AppointmentStatusrr. ?
.rr? @
	Confirmedrr@ I
)ss 
)ss 
.tt 
ToListAsynctt 
(tt 
cancellationTokentt .
)tt. /
;tt/ 0
ifvv 
(vv 
overdueAppointmentsvv #
.vv# $
Countvv$ )
==vv* ,
$numvv- .
)vv. /
{ww 
_loggerxx 
.xx 
LogInformationxx &
(xx& '
$str	yy Ñ
,
yyÑ Ö
todayzz 
)zz 
;zz 
return|| 
affectedCacheKeys|| (
;||( )
}}} 
foreach 
( 
var 
appointment $
in% '
overdueAppointments( ;
); <
{
ÄÄ 
if
ÅÅ 
(
ÅÅ 
appointment
ÅÅ 
.
ÅÅ  
Status
ÅÅ  &
==
ÅÅ' )
AppointmentStatus
ÅÅ* ;
.
ÅÅ; <
Pending
ÅÅ< C
)
ÅÅC D
{
ÇÇ 
appointment
ÉÉ 
.
ÉÉ  
Status
ÉÉ  &
=
ÉÉ' (
AppointmentStatus
ÉÉ) :
.
ÉÉ: ;
	Cancelled
ÉÉ; D
;
ÉÉD E
appointment
ÑÑ 
.
ÑÑ   
CancellationReason
ÑÑ  2
=
ÑÑ3 4+
PendingAutoCancellationReason
ÑÑ5 R
;
ÑÑR S
}
ÖÖ 
else
ÜÜ 
if
ÜÜ 
(
ÜÜ 
appointment
ÜÜ $
.
ÜÜ$ %
Status
ÜÜ% +
==
ÜÜ, .
AppointmentStatus
ÜÜ/ @
.
ÜÜ@ A
	Confirmed
ÜÜA J
)
ÜÜJ K
{
áá 
appointment
àà 
.
àà  
Status
àà  &
=
àà' (
AppointmentStatus
àà) :
.
àà: ;
	Cancelled
àà; D
;
ààD E
appointment
ââ 
.
ââ   
CancellationReason
ââ  2
=
ââ3 4-
ConfirmedAutoCancellationReason
ââ5 T
;
ââT U
}
ää 
affectedCacheKeys
åå !
.
åå! "
Add
åå" %
(
åå% &'
BuildAvailabilityCacheKey
çç -
(
çç- .
appointment
éé #
.
éé# $
DoctorId
éé$ ,
,
éé, -
appointment
èè #
.
èè# $
ScheduledDate
èè$ 1
)
èè1 2
)
èè2 3
;
èè3 4
}
êê 
await
íí 
	dbContext
íí 
.
íí 
SaveChangesAsync
íí ,
(
íí, -
cancellationToken
íí- >
)
íí> ?
;
íí? @
_logger
îî 
.
îî 
LogInformation
îî "
(
îî" #
$str
ïï y
,
ïïy z!
overdueAppointments
ññ #
.
ññ# $
Count
ññ$ )
,
ññ) *
today
óó 
)
óó 
;
óó 
return
ôô 
affectedCacheKeys
ôô $
;
ôô$ %
}
öö 	
private
úú 
async
úú 
Task
úú 1
#DeleteOldCancelledAppointmentsAsync
úú >
(
úú> ?!
HealthAxisDbContext
ùù 
	dbContext
ùù  )
,
ùù) *
DateOnly
ûû 
today
ûû 
,
ûû 
CancellationToken
üü 
cancellationToken
üü /
)
üü/ 0
{
†† 	
var
°° 
currentMonthStart
°° !
=
°°" #
new
¢¢ 
DateOnly
¢¢ 
(
¢¢ 
today
¢¢ "
.
¢¢" #
Year
¢¢# '
,
¢¢' (
today
¢¢) .
.
¢¢. /
Month
¢¢/ 4
,
¢¢4 5
$num
¢¢6 7
)
¢¢7 8
;
¢¢8 9
var
§§ 
targetMonthStart
§§  
=
§§! "
currentMonthStart
•• !
.
••! "
	AddMonths
••" +
(
••+ ,
-
••, -
$num
••- .
)
••. /
;
••/ 0
var
ßß %
targetMonthEndExclusive
ßß '
=
ßß( )
targetMonthStart
®®  
.
®®  !
	AddMonths
®®! *
(
®®* +
$num
®®+ ,
)
®®, -
;
®®- .
var
™™ &
oldCancelledAppointments
™™ (
=
™™) *
await
™™+ 0
	dbContext
™™1 :
.
™™: ;
Appointments
™™; G
.
´´ 
Where
´´ 
(
´´ 
appointment
´´ "
=>
´´# %
appointment
¨¨ 
.
¨¨  
Status
¨¨  &
==
¨¨' )
AppointmentStatus
¨¨* ;
.
¨¨; <
	Cancelled
¨¨< E
&&
¨¨F H
appointment
≠≠ 
.
≠≠  
ScheduledDate
≠≠  -
>=
≠≠. 0
targetMonthStart
≠≠1 A
&&
≠≠B D
appointment
ÆÆ 
.
ÆÆ  
ScheduledDate
ÆÆ  -
<
ÆÆ. /%
targetMonthEndExclusive
ÆÆ0 G
)
ÆÆG H
.
ØØ 
ToListAsync
ØØ 
(
ØØ 
cancellationToken
ØØ .
)
ØØ. /
;
ØØ/ 0
if
±± 
(
±± &
oldCancelledAppointments
±± (
.
±±( )
Count
±±) .
==
±±/ 1
$num
±±2 3
)
±±3 4
{
≤≤ 
_logger
≥≥ 
.
≥≥ 
LogInformation
≥≥ &
(
≥≥& '
$str¥¥ ì
,¥¥ì î
targetMonthStart
µµ $
,
µµ$ %%
targetMonthEndExclusive
∂∂ +
.
∂∂+ ,
AddDays
∂∂, 3
(
∂∂3 4
-
∂∂4 5
$num
∂∂5 6
)
∂∂6 7
)
∂∂7 8
;
∂∂8 9
return
∏∏ 
;
∏∏ 
}
ππ 
	dbContext
ªª 
.
ªª 
Appointments
ªª "
.
ªª" #
RemoveRange
ªª# .
(
ªª. /&
oldCancelledAppointments
ªª/ G
)
ªªG H
;
ªªH I
await
ΩΩ 
	dbContext
ΩΩ 
.
ΩΩ 
SaveChangesAsync
ΩΩ ,
(
ΩΩ, -
cancellationToken
ΩΩ- >
)
ΩΩ> ?
;
ΩΩ? @
_logger
øø 
.
øø 
LogInformation
øø "
(
øø" #
$str¿¿ £
,¿¿£ §&
oldCancelledAppointments
¡¡ (
.
¡¡( )
Count
¡¡) .
,
¡¡. /
targetMonthStart
¬¬  
,
¬¬  !%
targetMonthEndExclusive
√√ '
.
√√' (
AddDays
√√( /
(
√√/ 0
-
√√0 1
$num
√√1 2
)
√√2 3
)
√√3 4
;
√√4 5
}
ƒƒ 	
private
∆∆ 
async
∆∆ 
Task
∆∆ /
!InvalidateAvailabilityCachesAsync
∆∆ <
(
∆∆< =
IDistributedCache
«« 
cache
«« #
,
««# $
HashSet
»» 
<
»» 
string
»» 
>
»» 
	cacheKeys
»» %
,
»»% &
CancellationToken
…… 
cancellationToken
…… /
)
……/ 0
{
   	
foreach
ÀÀ 
(
ÀÀ 
var
ÀÀ 
cacheKey
ÀÀ !
in
ÀÀ" $
	cacheKeys
ÀÀ% .
)
ÀÀ. /
{
ÃÃ 
try
ÕÕ 
{
ŒŒ 
await
œœ 
cache
œœ 
.
œœ  
RemoveAsync
œœ  +
(
œœ+ ,
cacheKey
––  
,
––  !
cancellationToken
—— )
)
——) *
;
——* +
_logger
”” 
.
”” 
LogInformation
”” *
(
””* +
$str
‘‘ p
,
‘‘p q
cacheKey
’’  
)
’’  !
;
’’! "
}
÷÷ 
catch
◊◊ 
(
◊◊ 
	Exception
◊◊  
ex
◊◊! #
)
◊◊# $
{
ÿÿ 
_logger
ŸŸ 
.
ŸŸ 

LogWarning
ŸŸ &
(
ŸŸ& '
ex
⁄⁄ 
,
⁄⁄ 
$str
€€ }
,
€€} ~
cacheKey
‹‹  
)
‹‹  !
;
‹‹! "
}
›› 
}
ﬁﬁ 
}
ﬂﬂ 	
private
·· 
static
·· 
string
·· '
BuildAvailabilityCacheKey
·· 7
(
··7 8
int
‚‚ 
doctorId
‚‚ 
,
‚‚ 
DateOnly
„„ 
date
„„ 
)
„„ 
{
‰‰ 	
return
ÂÂ 
$"
ÂÂ 
$str
ÂÂ 
{
ÂÂ 
doctorId
ÂÂ &
}
ÂÂ& '
$str
ÂÂ' 5
{
ÂÂ5 6
date
ÂÂ6 :
:
ÂÂ: ;
$str
ÂÂ; E
}
ÂÂE F
"
ÂÂF G
;
ÂÂG H
}
ÊÊ 	
public
ËË 
override
ËË 
async
ËË 
Task
ËË "
	StopAsync
ËË# ,
(
ËË, -
CancellationToken
ËË- >
cancellationToken
ËË? P
)
ËËP Q
{
ÈÈ 	
_logger
ÍÍ 
.
ÍÍ 
LogInformation
ÍÍ "
(
ÍÍ" #
$str
ÍÍ# _
)
ÍÍ_ `
;
ÍÍ` a
await
ÏÏ 
base
ÏÏ 
.
ÏÏ 
	StopAsync
ÏÏ  
(
ÏÏ  !
cancellationToken
ÏÏ! 2
)
ÏÏ2 3
;
ÏÏ3 4
}
ÌÌ 	
}
ÓÓ 
}ÔÔ 