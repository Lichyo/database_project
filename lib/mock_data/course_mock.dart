import 'package:database_project/model/course.dart';

class MockCourse {
  List<Course> chiyuCourses = [];
  List<Course> yitongCourses = [];

  MockCourse() {
    chiyuCourses.add(
      Course(
        name: '扯鈴',
        teacher: '體育老師',
        classroom: '大禮堂',
        time: '05~06',
        week: '一',
      ),
    );
    chiyuCourses.add(
      Course(
        name: '性別政策概論',
        teacher: '陳斐玲',
        classroom: 'C625',
        time: '07~08',
        week: '一',
      ),
    );
    chiyuCourses.add(
      Course(
        name: '資料庫',
        teacher: '游象甫',
        classroom: 'F501',
        time: 'ON~06',
        week: '二',
      ),
    );
    chiyuCourses.add(
      Course(
        name: '作業系統',
        teacher: '陳永昇',
        classroom: 'F401A',
        time: '02~04',
        week: '三',
      ),
    );
    chiyuCourses.add(
      Course(
        name: '工程數學',
        teacher: '王富祥',
        classroom: 'C631',
        time: '02~04',
        week: '四',
      ),
    );
    chiyuCourses.add(
      Course(
        name: '網路應用與產業發展',
        teacher: '陳星詠',
        classroom: 'B505',
        time: '05~07',
        week: '四',
      ),
    );
    chiyuCourses.add(
      Course(
        name: '機器學習',
        teacher: '王人正',
        classroom: 'B505',
        time: '05~07',
        week: '五',
      ),
    );

  }
}
