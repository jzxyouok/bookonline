//+++++++ 判断用户是否选择了记录
  function getSelectedItem(frm){
    var p_FrmDataLst = frm;
    //－－－判断有没有记录，没有就返回null
    if (p_FrmDataLst.recordID==null) { 
       //alert("null");
       return null;
    }
    //－－判断有一条记录的情况
    if(p_FrmDataLst.recordID.checked) {
        //alert(p_FrmDataLst.recordID.value);
        return p_FrmDataLst.recordID.value;      
      } 
    //－－有多条记录时的判断。
    for( i=0; i < p_FrmDataLst.recordID.length; i++ ) {    
      if( p_FrmDataLst.recordID[i].checked ) { 
         //alert(p_FrmDataLst.recordID[i].value);
         return p_FrmDataLst.recordID[i].value; 
      }
    }
    return null;
  }
