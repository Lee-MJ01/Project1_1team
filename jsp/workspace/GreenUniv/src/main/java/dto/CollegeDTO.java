package dto;

public class CollegeDTO {
    private String college_name;     // 대학명 (PK)
    private String college_name_en;  // 대학 영문명
    private String intro_title;      // 소개 제목
    private String intro_body;       // 소개 내용
    private String image_path;       // 이미지 경로

    public String getCollege_name() { return college_name; }
    public void setCollege_name(String college_name) { this.college_name = college_name; }

    public String getCollege_name_en() { return college_name_en; }
    public void setCollege_name_en(String college_name_en) { this.college_name_en = college_name_en; }

    public String getIntro_title() { return intro_title; }
    public void setIntro_title(String intro_title) { this.intro_title = intro_title; }

    public String getIntro_body() { return intro_body; }
    public void setIntro_body(String intro_body) { this.intro_body = intro_body; }

    public String getImage_path() { return image_path; }
    public void setImage_path(String image_path) { this.image_path = image_path; }

    @Override
    public String toString() {
        return "CollegeDTO [college_name=" + college_name +
               ", college_name_en=" + college_name_en +
               ", intro_title=" + intro_title +
               ", intro_body=" + intro_body +
               ", image_path=" + image_path + "]";
    }
}
