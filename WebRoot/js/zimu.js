
function stat(){
var a = pageYOffset+window.innerHeight-document.bar.document.height-15
document.bar.top = a
setTimeout('stat()',2)
}
function fix(){
nome=navigator.appName
if(nome=='Netscape'){
stat()
}
else{
var a=document.body.scrollTop+document.body.clientHeight-document.all.bar.offsetHeight+15
bar.style.top = a
}}
//-->
<!-- //
var thissize=20
var textfont="隶书"
var textcolor= new Array()
textcolor[0]="000000"
textcolor[1]="000000"
textcolor[2]="000000"
textcolor[3]="111111"
textcolor[4]="222222"
textcolor[5]="333333"
textcolor[6]="444444"
textcolor[7]="555555"
textcolor[8]="666666"
textcolor[9]="777777"
textcolor[10]="888888"
textcolor[11]="999999"
textcolor[12]="aaaaaa"
textcolor[13]="bbbbbb"
textcolor[14]="cccccc"
textcolor[15]="dddddd"
textcolor[16]="eeeeee"
textcolor[17]="ffffff"
textcolor[18]="ffffff"
var message = new Array()
message[0]="欢迎使用武昌火车订票系统!@_@ "

i_message=0
var i_strength=0
var i_message=0
var timer
function glowtext() { 
if(document.all) {
if (i_strength <=17) {
glowdiv.innerText=message[i_message]
document.all.glowdiv.style.filter="glow(color="+textcolor[i_strength]+", strength=4)"
i_strength++
timer=setTimeout("glowtext()",100)
}
else {
clearTimeout(timer)
setTimeout("deglowtext()",1500)
}
}
}function deglowtext() { 
if(document.all) {
if (i_strength >=0) {
glowdiv.innerText=message[i_message]
document.all.glowdiv.style.filter="glow(color="+textcolor[i_strength]+", strength=4)"
i_strength--
timer=setTimeout("deglowtext()",100)
}
else {
clearTimeout(timer)
i_message++
if (i_message>=message.length) {i_message=0}
i_strength=0
intermezzo()
}
}
}
function intermezzo() { 
glowdiv.innerText=""
setTimeout("glowtext()",1500) 
}
//-->
var MESSAGE="欢迎使用武昌火车订票系统 !@_@ ^_^ -.- -_-"
var POSITION=100
var DELAY=5
var scroll=new statusMessageObject()
function statusMessageObject(p,d){
this.msg =MESSAGE
this.out =" "
this.pos =POSITION
this.delay=DELAY
this.i=0
this.reset=clearMessage}
function clearMessage(){
this.pos=POSITION}
function scroller(){
for (scroll.i=0;scroll.i<scroll.pos;scroll.i++){
scroll.out += " "}
if (scroll.pos >= 0)
scroll.out += scroll.msg
else scroll.out=scroll.msg.substring(-scroll.pos,scroll.msg.length)
window.status=scroll.out
scroll.out=" "
scroll.pos--
if (scroll.pos < -(scroll.msg.length)) {
scroll.reset()}
setTimeout('scroller()',scroll.delay)}
function snapIn(jumpSpaces,position){
var msg = scroll.msg
var out = ""
for(var i=0; i<position; i++) 
{out+= msg.charAt(i)}
for(i=1;i<jumpSpaces;i++) 
{out += " "}
out+=msg.charAt(position)
window.status = out
if(jumpSpaces <= 1) {
position++
if(msg.charAt(position) == ' ') 
{position++ }
jumpSpaces = 100-position
}else if (jumpSpaces > 3)
{jumpSpaces *= .75}
else
{jumpSpaces--}
if(position != msg.length) {
var cmd = "snapIn(" + jumpSpaces + "," + position + ")";
scrollID = window.setTimeout(cmd,scroll.delay);
}else{window.status=""
jumpSpaces=0
position=0
cmd = "snapIn(" + jumpSpaces + "," + position + ")";
scrollID = window.setTimeout(cmd,scroll.delay);
return false }
return true}
snapIn(100,0);