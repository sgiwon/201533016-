package util;


//������
public class PagingCount {
	int links = 10; //������ ��ũ�� ����
	int limit = 10; //���ڵ��� ����
	int totalpage= 0; //��ü������
	
	public PagingCount(){
		super();
	}

	public PagingCount(int numrows){
		super();
		this.totalpage = ((numrows-1)/limit)+1;
	}
	
	public PagingCount(int numrows, int links, int limit){
		super();
		this.links = links;
		this.limit = limit;
		this.totalpage = ((numrows-1)/limit)+1;
	}
	
	public int countOffset(int page){
		int offset=(page-1)*this.limit;
		return offset;
	}
	
	public String showPaging(int pagelink, String pagename){
		String str = "";
		
		str = "<div class='pagging'>";
		
		int bpage=0;
		int boffset = 0;
		
		int cpage=0;
		int coffset=0;
		
		int vpage=0;
		int noffset=0;
		
		int loffset=0;
		
	
		if(pagelink != 1){
			str +="<a href="+pagename+"?pagelink=1&offset=0>ó��</a>";
		}else{
			str +="<span>ó��</span>";
		}
		
		
		bpage = pagelink -10;
		boffset = countOffset(bpage);
		if(pagelink > links){
			str +="<a href="+pagename+"?pagelink="+bpage+"&offset="+boffset+">����10</a>";
		}else{
			str +="<span>����10</span>";
		}
		
	
		vpage = pagelink;
		pagelink = ((pagelink -1)/links)*links+1;
		for(cpage=pagelink;cpage<pagelink+links;cpage++){
			if(cpage>totalpage){
				break;
			}
			coffset = countOffset(cpage);
			if(cpage !=vpage){
				str +="<a href="+pagename+"?pagelink="+cpage+"&offset="+coffset+">"+cpage+"</a>";
			}else{
				str +="<span>"+cpage+"</span>";
			}
		}
		
		noffset = countOffset(cpage);
		
		if((totalpage-pagelink)>=links){
			str +="<a href="+pagename+"?pagelink="+cpage+"&offset="+noffset+">����10</a>";
		}else{
			str +="<span>����10</span>";
		}
		
		//������������
		loffset = countOffset(totalpage);
		
		if(vpage !=totalpage){
			str +="<a href="+pagename+"?pagelink="+totalpage+"&offset="+loffset+">������</a>";
		}else{
			str +="<span>������</span>";
		}
		
		str +="</div>";
		
		
		return str;
	}
	
	public String showPaging(int pagelink, String pagename, String find, String search){
		String str = "";
		
		str = "<div class='pagging'>";
		
		int bpage=0;
		int boffset = 0;
		
		int cpage=0;
		int coffset=0;
		
		int vpage=0;
		int noffset=0;
		
		int loffset=0;
		
		
		if(pagelink != 1){
			str +="<a href="+pagename+"?pagelink=1&offset=0&find="+find+"&search="+search+">ó��</a>";
		}else{
			str +="<span>ó��</span>";
		}
		
		
		bpage = pagelink -10;
		boffset = countOffset(bpage);
		if(pagelink > links){
			str +="<a href="+pagename+"?pagelink="+bpage+"&offset="+boffset+"&find="+find+"&search="+search+">����10</a>";
		}else{
			str +="<span>����10</span>";
		}
		
		//��ũ������
		vpage = pagelink;
		pagelink = ((pagelink -1)/links)*links+1;
		for(cpage=pagelink;cpage<pagelink+links;cpage++){
			if(cpage>totalpage){
				break;
			}
			coffset = countOffset(cpage);
			if(cpage !=vpage){
				str +="<a href="+pagename+"?pagelink="+cpage+"&offset="+coffset+"&find="+find+"&search="+search+">"+cpage+"</a>";
			}else{
				str +="<span>"+cpage+"</span>";
			}
		}
		
		noffset = countOffset(cpage);
		
		if((totalpage-pagelink)>=links){
			str +="<a href="+pagename+"?pagelink="+cpage+"&offset="+noffset+"&find="+find+"&search="+search+">����10</a>";
		}else{
			str +="<span>����10</span>";
		}
		
	
		loffset = countOffset(totalpage);
		
		if(vpage !=totalpage){
			str +="<a href="+pagename+"?pagelink="+totalpage+"&offset="+loffset+"&find="+find+"&search="+search+">������</a>";
		}else{
			str +="<span>������</span>";
		}
		
		str +="</div>";
		
		
		return str;
	}
}
