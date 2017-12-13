package util;


//페이지
public class PagingCount {
	int links = 10; //페이지 링크의 갯수
	int limit = 10; //레코드의 갯수
	int totalpage= 0; //전체페이지
	
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
			str +="<a href="+pagename+"?pagelink=1&offset=0>처음</a>";
		}else{
			str +="<span>처음</span>";
		}
		
		
		bpage = pagelink -10;
		boffset = countOffset(bpage);
		if(pagelink > links){
			str +="<a href="+pagename+"?pagelink="+bpage+"&offset="+boffset+">이전10</a>";
		}else{
			str +="<span>이전10</span>";
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
			str +="<a href="+pagename+"?pagelink="+cpage+"&offset="+noffset+">다음10</a>";
		}else{
			str +="<span>다음10</span>";
		}
		
		//마지막페이지
		loffset = countOffset(totalpage);
		
		if(vpage !=totalpage){
			str +="<a href="+pagename+"?pagelink="+totalpage+"&offset="+loffset+">마지막</a>";
		}else{
			str +="<span>마지막</span>";
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
			str +="<a href="+pagename+"?pagelink=1&offset=0&find="+find+"&search="+search+">처음</a>";
		}else{
			str +="<span>처음</span>";
		}
		
		
		bpage = pagelink -10;
		boffset = countOffset(bpage);
		if(pagelink > links){
			str +="<a href="+pagename+"?pagelink="+bpage+"&offset="+boffset+"&find="+find+"&search="+search+">이전10</a>";
		}else{
			str +="<span>이전10</span>";
		}
		
		//링크페이지
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
			str +="<a href="+pagename+"?pagelink="+cpage+"&offset="+noffset+"&find="+find+"&search="+search+">다음10</a>";
		}else{
			str +="<span>다음10</span>";
		}
		
	
		loffset = countOffset(totalpage);
		
		if(vpage !=totalpage){
			str +="<a href="+pagename+"?pagelink="+totalpage+"&offset="+loffset+"&find="+find+"&search="+search+">마지막</a>";
		}else{
			str +="<span>마지막</span>";
		}
		
		str +="</div>";
		
		
		return str;
	}
}
