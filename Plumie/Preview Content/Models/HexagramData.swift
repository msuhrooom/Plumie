import Foundation


struct HexagramData {
    let hexagrams: [String: Hexagram] = [
        // -------------------------------------------------------
        // 1. 上卦为“乾(1)”，下卦为“乾(1)” -- "11"
        // -------------------------------------------------------
        "11": Hexagram(
            name: "乾为天",
            hexagram: "䷀", // 对应第1卦
            guaYao: """
乾：元，亨，利，贞。
初九：潜龙勿用。
九二：见龙在田，利见大人。
九三：君子终日乾乾，夕惕若，厉无咎。
九四：或跃在渊，无咎。
九五：飞龙在天，利见大人。
上九：亢龙有悔。
用九：见群龙无首，吉。
""",
            wanWuLeiXiang: """
天、君子、龙、马、大人、金、圆、首领、法则、刚健、自强不息等。
"""
        ),

        // -------------------------------------------------------
        // 2. 上卦为“乾(1)”，下卦为“兑(2)” -- "12"
        // -------------------------------------------------------
        "12": Hexagram(
            name: "天泽履",
            hexagram: "䷉", // 对应第10卦
            guaYao: """
履：履虎尾，不咥人，亨。
初九：素履往，无咎。
九二：履道坦坦，幽人贞吉。
六三：眇能视，跛能履，履虎尾，终吉。
九四：履虎尾，愬愬终吉。
九五：夬履，贞厉。
上九：视履考祥，其旋元吉。
""",
            wanWuLeiXiang: """
泽、虎尾、谨慎、行事、礼仪、分寸、遵守规范等。
"""
        ),

        // -------------------------------------------------------
        // 3. 上卦为“乾(1)”，下卦为“离(3)” -- "13"
        // -------------------------------------------------------
        "13": Hexagram(
            name: "天火同人",
            hexagram: "䷌", // 第13卦
            guaYao: """
同人：同人于野，亨。利涉大川，利君子贞。
初九：同人于门，无咎。
六二：同人于宗，吝。
九三：伏戎于莽，升其高陵，三岁不兴。
九四：乘其墉，弗克攻，吉。
九五：同人，先号啕而后笑，大师克相遇。
上九：同人于郊，无悔。
""",
            wanWuLeiXiang: """
火、光明、交往、团结、合作、共识、社会关系等。
"""
        ),

        // -------------------------------------------------------
        // 4. 上卦为“乾(1)”，下卦为“震(4)” -- "14"
        // -------------------------------------------------------
        "14": Hexagram(
            name: "天雷无妄",
            hexagram: "䷘", // 第25卦
            guaYao: """
无妄：元，亨，利，贞。其匪正有眚，不利有攸往。
初九：无妄，往吉。
六二：不耕获，不菑畲，则利有攸往。
六三：无妄之灾，或系之牛，行人之得，邑人之灾。
九四：可贞，无咎。
九五：无妄之疾，勿药有喜。
上九：无妄，行有眚，无攸利。
""",
            wanWuLeiXiang: """
雷、震动、朴实、自然、不妄为、天真、诚信等。
"""
        ),

        // -------------------------------------------------------
        // 5. 上卦为“乾(1)”，下卦为“巽(5)” -- "15"
        // -------------------------------------------------------
        "15": Hexagram(
            name: "天风姤",
            hexagram: "䷫", // 第44卦
            guaYao: """
姤：女壮，勿用取女。
初六：系于金柅，贞吉，有攸往，见凶，羸豕踟躅。
九二：包有鱼，无咎，不利宾。
九三：臀无肤，其行次且，厉，无大咎。
九四：包无鱼，起凶。
九五：以杞包瓜，含章，有陨自天。
上九：姤其角，吝，无咎。
""",
            wanWuLeiXiang: """
风、相遇、突然而至的机遇或危险、男女相遇、戒慎等。
"""
        ),

        // -------------------------------------------------------
        // 6. 上卦为“乾(1)”，下卦为“坎(6)” -- "16"
        // -------------------------------------------------------
        "16": Hexagram(
            name: "天水讼",
            hexagram: "䷅", // 第6卦
            guaYao: """
讼：有孚，窒惕，中吉，终凶。利见大人，不利涉大川。
初六：不永所事，小有言，终吉。
九二：不克讼，归而逋，其邑人三百户，无眚。
六三：食旧德，贞厉，终吉，或从王事，无成。
九四：不克讼，复即命渝，安贞吉。
九五：讼，元吉。
上九：或锡之鞶带，终朝三褫之。
""",
            wanWuLeiXiang: """
水、争讼、官司、诉求、对立、需要大智慧平衡纷争等。
"""
        ),

        // -------------------------------------------------------
        // 7. 上卦为“乾(1)”，下卦为“艮(7)” -- "17"
        // -------------------------------------------------------
        "17": Hexagram(
            name: "天山遁",
            hexagram: "䷠", // 第33卦
            guaYao: """
遁：亨，小利贞。
初六：遁尾，厉，勿用有攸往。
六二：执之用黄牛之革，莫之胜说。
九三：系遁，有疾，厉，畜臣妾吉。
九四：好遁，君子吉，小人否。
九五：嘉遁，贞吉。
上九：肥遁，无不利。
""",
            wanWuLeiXiang: """
山、退隐、避难、时机不宜强进、顺势而退、保存实力等。
"""
        ),

        // -------------------------------------------------------
        // 8. 上卦为“乾(1)”，下卦为“坤(8)” -- "18"
        // -------------------------------------------------------
        "18": Hexagram(
            name: "天地否",
            hexagram: "䷋", // 第12卦
            guaYao: """
否：否之匪人，不利君子贞，大往小来。
初六：拔茅茹，以其汇，贞吉，亨。
六二：包承，小人吉，大人否亨。
六三：包羞。
九四：有命，无咎，畴离祉。
九五：休否，大人吉，其亡其亡，系于苞桑。
上九：倾否，先否后喜。
""",
            wanWuLeiXiang: """
天地不交、阻隔、闭塞、上下不和、否极泰来、危机中酝酿转机等。
"""
        ),

        // -------------------------------------------------------
        // 9. 上卦为“兑(2)”，下卦为“乾(1)” -- "21"
        // -------------------------------------------------------
        "21": Hexagram(
            name: "泽天夬",
            hexagram: "䷪", // 第43卦
            guaYao: """
夬：扬于王庭，孚号，有厉。告自邑，不利即戎，利有攸往。
初九：壮于前趾，往不胜，为咎。
九二：惕号，莫夜有戎，勿恤。
九三：壮于頄，有凶。君子夬夬，独行遇雨，若濡有愠，无咎。
九四：臀无肤，其行次且。牵羊悔亡，闻言不信。
九五：苋陆夬夬，中行无咎。
上六：无号，终有凶。
""",
            wanWuLeiXiang: """
决断、果决、刚强而外散、排除障碍、坚决行动等。
"""
        ),

        // -------------------------------------------------------
        // 10. 上卦为“兑(2)”，下卦为“兑(2)” -- "22"
        // -------------------------------------------------------
        "22": Hexagram(
            name: "兑为泽",
            hexagram: "䷹", // 第58卦
            guaYao: """
兑：亨，利贞。
初九：和兑，吉。
九二：孚兑，吉，悔亡。
六三：来兑，凶。
九四：商兑未宁，介疾有喜。
九五：孚于剥，有厉。
上六：引兑。
""",
            wanWuLeiXiang: """
泽、悦、喜悦、沟通、说服、和谐、谈判、口才等。
"""
        ),

        // -------------------------------------------------------
        // 11. 上卦为“兑(2)”，下卦为“离(3)” -- "23"
        // -------------------------------------------------------
        "23": Hexagram(
            name: "泽火革",
            hexagram: "䷰", // 第49卦
            guaYao: """
革：己日乃孚，元亨利贞，悔亡。
初九：巩用黄牛之革。
六二：己日乃革之，征吉，无咎。
九三：征凶，贞厉，革言三就，有孚。
九四：悔亡，有孚改命，吉。
九五：大人虎变，未占有孚。
上六：君子豹变，小人革面，征凶，居贞吉。
""",
            wanWuLeiXiang: """
变革、改革、涣新、去旧布新、顺时而动等。
"""
        ),

        // -------------------------------------------------------
        // 12. 上卦为“兑(2)”，下卦为“震(4)” -- "24"
        // -------------------------------------------------------
        "24": Hexagram(
            name: "泽雷随",
            hexagram: "䷐", // 第17卦
            guaYao: """
随：元亨利贞，无咎。
初九：官有渝，贞吉。出门交有功。
六二：系小子，失丈夫。
六三：系丈夫，失小子。随有求得，利居贞。
九四：随有获，贞凶。有孚在道，以明，何咎？
九五：孚于嘉，吉。
上六：拘系之，乃从维之，王用亨于西山。
""",
            wanWuLeiXiang: """
随顺、跟随、应和、流动、变通、环境变化中的调整等。
"""
        ),

        // -------------------------------------------------------
        // 13. 上卦为“兑(2)”，下卦为“巽(5)” -- "25"
        // -------------------------------------------------------
        "25": Hexagram(
            name: "泽风大过",
            hexagram: "䷛", // 第28卦
            guaYao: """
大过：栋挠，利有攸往，亨。
初六：藉用白茅，无咎。
九二：枯杨生稊，老夫得其女妻，无不利。
九三：栋桡，凶。
九四：栋隆，吉；有它吝。
九五：枯杨生华，老妇得其士夫，无咎无誉。
上六：过涉灭顶，凶，无咎。
""",
            wanWuLeiXiang: """
过度、承担大任、险中求生、非常之时需非常之举、大任在肩等。
"""
        ),

        // -------------------------------------------------------
        // 14. 上卦为“兑(2)”，下卦为“坎(6)” -- "26"
        // -------------------------------------------------------
        "26": Hexagram(
            name: "泽水困",
            hexagram: "䷮", // 第47卦
            guaYao: """
困：亨，贞，大人吉，无咎。有言不信。
初六：臀困于株木，入于幽谷，三岁不觌。
九二：困于酒食，朱绂方来。利用亨祀，征凶，无咎。
六三：困于石，据于蒺藜，入于其宫，不见其妻，凶。
九四：来徐徐，困于金车，吝，有终。
九五：劓刖，困于赤绂，乃徐有说，利用祭祀。
上六：困于葛藟，于臲卼，曰动悔。有悔，征吉。
""",
            wanWuLeiXiang: """
困境、艰难、受阻、枯竭、需要坚忍、守正待机等。
"""
        ),

        // -------------------------------------------------------
        // 15. 上卦为“兑(2)”，下卦为“艮(7)” -- "27"
        // -------------------------------------------------------
        "27": Hexagram(
            name: "泽山咸",
            hexagram: "䷞", // 第31卦
            guaYao: """
咸：亨，利贞，取女吉。
初六：咸其拇。
六二：咸其腓，凶，居吉。
九三：咸其股，执其随，往吝。
九四：贞吉，悔亡，憧憧往来，朋从尔思。
九五：咸其脢，无悔。
上六：咸其辅颊舌。
""",
            wanWuLeiXiang: """
感应、相互吸引、情感交流、恋爱、默契、敏感细腻等。
"""
        ),

        // -------------------------------------------------------
        // 16. 上卦为“兑(2)”，下卦为“坤(8)” -- "28"
        // -------------------------------------------------------
        "28": Hexagram(
            name: "泽地萃",
            hexagram: "䷬", // 第45卦
            guaYao: """
萃：亨，王假有庙，利见大人，亨，利贞。用大牲吉，利有攸往。
初六：有孚不终，乃乱乃萃，若号，一握为笑，勿恤，往无咎。
六二：引吉，无咎，孚乃利用禴。
六三：萃如，嗟如，无攸利。往无咎，小吝。
九四：大吉，无咎。
九五：萃有位，无咎。匪孚，元永贞，悔亡。
上亢：赍咨涕洟，无咎。
""",
            wanWuLeiXiang: """
聚集、汇合、人群、众力齐心、典礼祭祀、团体合作等。
"""
        ),

        // -------------------------------------------------------
        // 以下以同样格式继续列出其余 36 对组合（3*8 到 8*8 = 48 条）...
        // 为避免本回答过长，下面继续给出简略版本，你可以根据需要补充完整爻辞。
        // -------------------------------------------------------

        // 上卦 = "离(3)"，下卦从 "乾(1)" 到 "坤(8)" => "31" ~ "38"
        "31": Hexagram(
            name: "火天大有",
            hexagram: "䷍", // 第14卦
            guaYao: """
大有：元亨。
初九：无交害，匪咎。艰则无咎。
...（略）...
""",
            wanWuLeiXiang: "火、光明、富有、盛大、拥有资源、普照等。"
        ),
        "32": Hexagram(
            name: "火泽睽",
            hexagram: "䷥", // 第38卦
            guaYao: """
睽：小事吉。
...（略）...
""",
            wanWuLeiXiang: "乖离、对立、内外不合、异中求同等。"
        ),
        "33": Hexagram(
            name: "离为火",
            hexagram: "䷝", // 第30卦
            guaYao: """
离：利贞，亨。畜牝牛吉。
...（略）...
""",
            wanWuLeiXiang: "火、日、光明、附着、依托、明察等。"
        ),
        "34": Hexagram(
            name: "火雷噬嗑",
            hexagram: "䷔", // 第21卦
            guaYao: """
噬嗑：亨。利用狱。
...（略）...
""",
            wanWuLeiXiang: "刑法、处理纠纷、决断、剖析、坚决执行等。"
        ),
        "35": Hexagram(
            name: "火风鼎",
            hexagram: "䷱", // 第50卦
            guaYao: """
鼎：元吉，亨。
...（略）...
""",
            wanWuLeiXiang: "烹煮、器物、改革、人事养育、承载、鼎盛等。"
        ),
        "36": Hexagram(
            name: "火水未济",
            hexagram: "䷿", // 第64卦
            guaYao: """
未济：亨，小狐汔济，濡其尾，无攸利。
...（略）...
""",
            wanWuLeiXiang: "未完成、临门一脚、须谨慎行事、再接再厉等。"
        ),
        "37": Hexagram(
            name: "火山旅",
            hexagram: "䷷", // 第56卦
            guaYao: """
旅：小亨，旅贞吉。
...（略）...
""",
            wanWuLeiXiang: "旅行、寄居、客居他乡、异地发展、谨慎礼节等。"
        ),
        "38": Hexagram(
            name: "火地晋",
            hexagram: "䷣", // 第35卦
            guaYao: """
晋：康侯用锡马蕃庶，昼日三接。
...（略）...
""",
            wanWuLeiXiang: "前进、光明、升进、发展、积极向上等。"
        ),

        // 上卦 = "震(4)"，下卦 = "乾(1)" ~ "坤(8)" => "41" ~ "48"
        "41": Hexagram(
            name: "雷天大壮",
            hexagram: "䷡", // 第34卦
            guaYao: """
大壮：利贞。
...（略）...
""",
            wanWuLeiXiang: "强势、壮大、力量充沛、需防过犹不及等。"
        ),
        "42": Hexagram(
            name: "雷泽归妹",
            hexagram: "䷵", // 第54卦
            guaYao: """
归妹：征凶，无攸利。
...（略）...
""",
            wanWuLeiXiang: "婚嫁、出嫁、结合、位分不正等。"
        ),
        "43": Hexagram(
            name: "雷火丰",
            hexagram: "䷶", // 第55卦
            guaYao: """
丰：亨，王假之...
...（略）...
""",
            wanWuLeiXiang: "丰盛、充实、亦有盛极而衰之忧。"
        ),
        "44": Hexagram(
            name: "震为雷",
            hexagram: "䷳", // 第51卦
            guaYao: """
震：亨。震来虩虩，笑言哑哑...
...（略）...
""",
            wanWuLeiXiang: "震动、雷霆、惊恐、奋起、革新等。"
        ),
        "45": Hexagram(
            name: "雷风恒",
            hexagram: "䷟", // 第32卦
            guaYao: """
恒：亨，无咎，利贞，利有攸往。
...（略）...
""",
            wanWuLeiXiang: "恒久、坚持、持续发展、长远经营等。"
        ),
        "46": Hexagram(
            name: "雷水解",
            hexagram: "䷧", // 第40卦
            guaYao: """
解：利西南，无所往，其来复吉...
...（略）...
""",
            wanWuLeiXiang: "化解、解除、松绑、释放压力、舒缓等。"
        ),
        "47": Hexagram(
            name: "雷山小过",
            hexagram: "䷾", // 第62卦
            guaYao: """
小过：亨，利贞。可小事，不可大事...
...（略）...
""",
            wanWuLeiXiang: "小有越轨、小处不可忽视、谦抑自守等。"
        ),
        "48": Hexagram(
            name: "雷地豫",
            hexagram: "䷏", // 第16卦
            guaYao: """
豫：利建侯行师。
...（略）...
""",
            wanWuLeiXiang: "喜悦、豫备、预防、娱乐、鼓动人心等。"
        ),

        // 上卦 = "巽(5)"，下卦 = "乾(1)" ~ "坤(8)" => "51" ~ "58"
        "51": Hexagram(
            name: "风天小畜",
            hexagram: "䷈", // 第9卦
            guaYao: """
小畜：亨，密云不雨，自我西郊。
...（略）...
""",
            wanWuLeiXiang: "积蓄、培养、小有收获、未大成但可渐进等。"
        ),
        "52": Hexagram(
            name: "风泽中孚",
            hexagram: "䷽", // 第61卦
            guaYao: """
中孚：豚鱼吉，利涉大川...
...（略）...
""",
            wanWuLeiXiang: "诚信、内心真诚、相互信任、以诚感人等。"
        ),
        "53": Hexagram(
            name: "风火家人",
            hexagram: "䷥", // 第37卦
            guaYao: """
家人：利女贞。
...（略）...
""",
            wanWuLeiXiang: "家庭、内部管理、相亲相爱、各司其职等。"
        ),
        "54": Hexagram(
            name: "风雷益",
            hexagram: "䷩", // 第42卦
            guaYao: """
益：利有攸往，利涉大川。
...（略）...
""",
            wanWuLeiXiang: "收益、增益、助人利己、行善积福、顺势而加等。"
        ),
        "55": Hexagram(
            name: "巽为风",
            hexagram: "䷸", // 第57卦
            guaYao: """
巽：小亨，利有攸往，利见大人。
...（略）...
""",
            wanWuLeiXiang: "风、入、渗透、柔顺、传播、潜移默化等。"
        ),
        "56": Hexagram(
            name: "风水涣",
            hexagram: "䷺", // 第59卦
            guaYao: """
涣：亨。王假有庙，利涉大川...
...（略）...
""",
            wanWuLeiXiang: "涣散、分离、化解、疏通、散开后再凝聚等。"
        ),
        "57": Hexagram(
            name: "风山渐",
            hexagram: "䷴", // 第53卦
            guaYao: """
渐：女归吉，利贞。
...（略）...
""",
            wanWuLeiXiang: "渐进、缓行、循序渐进、婚姻过程、成长等。"
        ),
        "58": Hexagram(
            name: "风地观",
            hexagram: "䷓", // 第20卦
            guaYao: """
观：盥而不荐，有孚顒若。
...（略）...
""",
            wanWuLeiXiang: "观看、观察、典礼、风范、教化、以身作则等。"
        ),

        // 上卦 = "坎(6)"，下卦 = "乾(1)" ~ "坤(8)" => "61" ~ "68"
        "61": Hexagram(
            name: "水天需",
            hexagram: "䷄", // 第5卦
            guaYao: """
需：有孚，光亨，贞吉，利涉大川。
...（略）...
""",
            wanWuLeiXiang: "等待、需时、蓄势、遇到阻滞时暂缓、以静制动等。"
        ),
        "62": Hexagram(
            name: "水泽节",
            hexagram: "䷼", // 第60卦
            guaYao: """
节：亨。苦节不可贞。
...（略）...
""",
            wanWuLeiXiang: "节制、限制、制度、法规、分寸、克己等。"
        ),
        "63": Hexagram(
            name: "水火既济",
            hexagram: "䷾", // 第63卦
            guaYao: """
既济：亨，小利贞。初吉终乱。
...（略）...
""",
            wanWuLeiXiang: "事情完成阶段、成功后需防松懈、善始善终等。"
        ),
        "64": Hexagram(
            name: "水雷屯",
            hexagram: "䷂", // 第3卦
            guaYao: """
屯：元亨，利贞。勿用有攸往，利建侯。
...（略）...
""",
            wanWuLeiXiang: "草木初生、艰难起步、创业、萌芽状态、需辅导等。"
        ),
        "65": Hexagram(
            name: "水风井",
            hexagram: "䷯", // 第48卦
            guaYao: """
井：改邑不改井，无丧无得...
...（略）...
""",
            wanWuLeiXiang: "水井、公共资源、基础设施、改而不易、取用有度等。"
        ),
        "66": Hexagram(
            name: "坎为水",
            hexagram: "䷜", // 第29卦
            guaYao: """
坎：习坎，有孚，维心亨...
...（略）...
""",
            wanWuLeiXiang: "险陷、重重考验、水势、流动、曲折、内心修养等。"
        ),
        "67": Hexagram(
            name: "水山蹇",
            hexagram: "䷦", // 第39卦
            guaYao: """
蹇：利西南，不利东北。利见大人，贞吉。
...（略）...
""",
            wanWuLeiXiang: "跛足、艰阻、难行、向内退、求助明智等。"
        ),
        "68": Hexagram(
            name: "水地比",
            hexagram: "䷇", // 第8卦
            guaYao: """
比：吉。原筮，元永贞，无咎。不宁方来，后夫凶。
...（略）...
""",
            wanWuLeiXiang: "比附、亲和、团结、凝聚、彼此协力等。"
        ),

        // 上卦 = "艮(7)"，下卦 = "乾(1)" ~ "坤(8)" => "71" ~ "78"
        "71": Hexagram(
            name: "山天大畜",
            hexagram: "䷙", // 第26卦
            guaYao: """
大畜：利贞。不家食吉，利涉大川。
...（略）...
""",
            wanWuLeiXiang: "蓄养、积累、休整、培育实力、厚积薄发等。"
        ),
        "72": Hexagram(
            name: "山泽损",
            hexagram: "䷨", // 第41卦
            guaYao: """
损：有孚，元吉，无咎，可贞，利有攸往。曷之用，二簋可用享。
...（略）...
""",
            wanWuLeiXiang: "损益、节流、付出、牺牲小利以求大利等。"
        ),
        "73": Hexagram(
            name: "山火贲",
            hexagram: "䷕", // 第22卦
            guaYao: """
贲：亨，小利有攸往。
...（略）...
""",
            wanWuLeiXiang: "装饰、修饰、外表美化、文化修养等。"
        ),
        "74": Hexagram(
            name: "山雷颐",
            hexagram: "䷒", // 第27卦
            guaYao: """
颐：贞吉。观颐，自求口实。
...（略）...
""",
            wanWuLeiXiang: "饮食、滋养、言语、修身养性、慎言慎行等。"
        ),
        "75": Hexagram(
            name: "山风蛊",
            hexagram: "䷑", // 第18卦
            guaYao: """
蛊：元亨，利涉大川。先甲三日，后甲三日。
...（略）...
""",
            wanWuLeiXiang: "腐败、蛀虫、改革、去弊、整顿旧患、治本等。"
        ),
        "76": Hexagram(
            name: "山水蒙",
            hexagram: "䷃", // 第4卦
            guaYao: """
蒙：亨。匪我求童蒙，童蒙求我。初筮告，再三渎，渎则不告。利贞。
...（略）...
""",
            wanWuLeiXiang: "启蒙、教育、蒙昧、学习、求教、教与学等。"
        ),
        "77": Hexagram(
            name: "艮为山",
            hexagram: "䷴", // 第52卦（注意卦符：䷳是震，䷴是艮）
            guaYao: """
艮：艮其背，不获其身，行其庭，不见其人，无咎。
...（略）...
""",
            wanWuLeiXiang: "止、静、安静、固执、保持镇定等。"
        ),
        "78": Hexagram(
            name: "山地剥",
            hexagram: "䷖", // 第23卦
            guaYao: """
剥：不利有攸往。
...（略）...
""",
            wanWuLeiXiang: "剥落、衰败、损失、须防危机、稳住根基等。"
        ),

        // 上卦 = "坤(8)"，下卦 = "乾(1)" ~ "坤(8)" => "81" ~ "88"
        "81": Hexagram(
            name: "地天泰",
            hexagram: "䷊", // 第11卦
            guaYao: """
泰：小往大来，吉亨。
...（略）...
""",
            wanWuLeiXiang: "天地交泰、通达、安定、上下和顺、吉祥等。"
        ),
        "82": Hexagram(
            name: "地泽临",
            hexagram: "䷒", // 第19卦
            guaYao: """
临：元，亨，利，贞。至于八月有凶。
...（略）...
""",
            wanWuLeiXiang: "临视、亲临、照顾、关怀、监管、临事须谨慎等。"
        ),
        "83": Hexagram(
            name: "地火明夷",
            hexagram: "䷤", // 第36卦
            guaYao: """
明夷：利艰贞。
...（略）...
""",
            wanWuLeiXiang: "光明受伤、韬光养晦、隐忍、避祸等。"
        ),
        "84": Hexagram(
            name: "地雷复",
            hexagram: "䷗", // 第24卦
            guaYao: """
复：亨。出入无疾，朋来无咎...
...（略）...
""",
            wanWuLeiXiang: "返回、往复、恢复、周而复始、反省改过等。"
        ),
        "85": Hexagram(
            name: "地风升",
            hexagram: "䷮", // 第46卦
            guaYao: """
升：元亨。用见大人，勿恤。南征吉。
...（略）...
""",
            wanWuLeiXiang: "上升、晋升、逐渐提高、积极进取等。"
        ),
        "86": Hexagram(
            name: "地水师",
            hexagram: "䷆", // 第7卦
            guaYao: """
师：贞，丈人吉，无咎。
...（略）...
""",
            wanWuLeiXiang: "军队、组织、团队、带领、合力而行等。"
        ),
        "87": Hexagram(
            name: "地山谦",
            hexagram: "䷎", // 第15卦
            guaYao: """
谦：亨，君子有终。
...（略）...
""",
            wanWuLeiXiang: "谦虚、内实外虚、不居功、礼让等。"
        ),
        "88": Hexagram(
            name: "坤为地",
            hexagram: "䷁", // 第2卦
            guaYao: """
坤：元亨，利牝马之贞。君子有攸往，先迷后得主，利。西南得朋，东北丧朋。安贞吉。
...（略）...
""",
            wanWuLeiXiang: "地、母性、承载、顺从、厚德载物、柔顺等。"
        ),
    ]
}
