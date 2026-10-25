# Edit in After Effects with Claude

**[العربية ↓](#arabic)**

A one-step setup by **Ismail — [ISMAILX](https://ismailx.com)** that lets **Claude** drive **Adobe After Effects** directly: create compositions, add layers, text, shapes and cameras, set keyframes, expressions and effects, and run scripts inside AE.

Watch how it works: https://youtube.com/shorts/u-hCINgRz-0

## What you need
- A **Mac or Windows** computer with **After Effects 2022 or newer**
- **Node.js** ([nodejs.org](https://nodejs.org))
- The **Claude** desktop app

## Install (once)
First, download this repo (green **Code** button → **Download ZIP**) and unzip it.

### Mac
1. Open Terminal, type `bash ` (with a space), drag `install.sh` onto the Terminal window, and press Enter.
2. It asks for your **Mac password** to copy the panel into the After Effects folder.
3. Quit the Claude app and open it again.

### Windows
1. Double-click `install.cmd` inside the unzipped folder.
2. If Windows shows **"Windows protected your PC"**, click **More info** → **Run anyway**.
3. When Windows asks for permission to make changes, click **Yes** (it copies the panel into the After Effects folder).
4. Quit the Claude app fully (also from the system tray next to the clock) and open it again.

The script does three things:
- builds the tool,
- puts the `mcp-bridge-auto.jsx` panel inside After Effects,
- adds the tool to Claude's settings (and backs up your old settings first).

## After Effects settings (once)
1. Open **Scripting & Expressions** settings (Mac: **After Effects > Settings**, Windows: **Edit > Preferences**) and enable **Allow Scripts to Write Files and Access Network**.
2. Open **Window > mcp-bridge-auto.jsx** and turn on **Auto-run commands**.
   In AE 2025 and newer the panel opens as a floating window and doesn't dock. That's normal.

Keep the panel window open while you work.

## Use
Tell Claude what you want, for example:
- "Make a 1920×1080, 60 fps comp and add a title that animates in"
- "Add a camera and give it a smooth zoom-in on the text"

## Tips for a professional result
- **Storyboard first:** have Claude write a precise storyboard before it builds anything, and approve it.
- **The camera moves, not the elements:** keep elements in place and move between scenes with match cuts.
- **One camera move per Null:** parent the camera to a Null, that Null to another Null, and so on. Start each move before the previous one ends so the motion flows without stopping.
- **One curve:** use the same curve on every keyframe, e.g. (0.84, 0, 0.16, 1), at 60 fps.
- **Keep your edits:** don't let Claude rebuild the project after you've edited it yourself. Ask it to change only the layer you want.

## Credits
Built on the open-source **[Dakkshin/after-effects-mcp](https://github.com/Dakkshin/after-effects-mcp)** (MIT licence). The original licence is in [`LICENSE`](LICENSE) and inside `after-effects-mcp/`.

---

<a id="arabic"></a>
<div dir="rtl">

# كيف تمنتج على After Effects باستخدام Claude

إعداد بخطوة وحدة من **إسماعيل — [ISMAILX](https://ismailx.com)**. يخلي **Claude** يتحكم في **After Effects** مباشرة: يسوي كومبوزيشن، ويضيف لايرات ونصوص وأشكال وكاميرا، ويحط كيفريمات وإكسبريشن وإفكتات، ويشغّل سكربتات داخل الأفتر.

شوف كيف يشتغل: https://youtube.com/shorts/u-hCINgRz-0

## وش تحتاج
- **ماك أو ويندوز** عليه **After Effects 2022 أو أحدث**
- **Node.js** (نزّله من [nodejs.org](https://nodejs.org))
- تطبيق **Claude** للديسكتوب

## التركيب (مرة وحدة)
أول شي، نزّل هالمستودع (الزر الأخضر **Code** ← **Download ZIP**) وفك الضغط.

### ماك
1. افتح التيرمنال، واكتب `bash ` (وبعدها مسافة)، واسحب ملف `install.sh` على نافذة التيرمنال، واضغط Enter.
2. بيطلب منك **باسورد الماك** عشان ينسخ البانل داخل مجلد After Effects.
3. سكّر تطبيق Claude وافتحه من جديد.

### ويندوز
1. دبل كليك على ملف `install.cmd` داخل المجلد اللي فكيته.
2. إذا طلعت لك رسالة **"Windows protected your PC"**، اضغط **More info** ← **Run anyway**.
3. لما يسألك الويندوز تسمح بالتغييرات، اضغط **Yes** (عشان ينسخ البانل داخل مجلد After Effects).
4. سكّر تطبيق Claude كامل (حتى من الأيقونة اللي جنب الساعة تحت) وافتحه من جديد.

السكربت يسوي ثلاث أشياء:
- يجهّز الأداة.
- يحط البانل `mcp-bridge-auto.jsx` داخل أفتر.
- يضيف الأداة لإعدادات Claude، ويسوي نسخة احتياطية من إعداداتك القديمة.

## إعدادات After Effects (مرة وحدة)
1. افتح إعدادات **Scripting & Expressions** (في الماك: **After Effects > Settings**، وفي الويندوز: **Edit > Preferences**) وفعّل **Allow Scripts to Write Files and Access Network**.
2. افتح **Window > mcp-bridge-auto.jsx** وفعّل **Auto-run commands**.
   في أفتر 2025 وأحدث، البانل يشتغل كنافذة عائمة وما يتثبت داخل الواجهة. هذا طبيعي.

خلّ نافذة البانل مفتوحة طول ما تشتغل.

## الاستخدام
اكتب لـClaude وش تبي، مثلاً:
- "سو كومبوزيشن 1920×1080 و60 فريم، وحط فيه عنوان يطلع بأنيميشن"
- "ضيف كاميرا وخليها تسوي زوم إن ناعم على النص"

## نصايح عشان النتيجة تطلع احترافية
- **ستوري بورد أول:** خلّ Claude يكتب لك ستوري بورد دقيق قبل ما يبني أي شي، ووافق عليه.
- **الكاميرا هي اللي تتحرك:** العناصر تبقى ثابتة في مكانها، وانتقل بين المشاهد بماتش كت.
- **كل حركة كاميرا على Null Object لحالها:** اربط الكاميرا بـNull، والـNull بـNull ثاني، وهكذا. خلّ كل حركة تبدأ قبل ما تخلص اللي قبلها، كذا الحركة تطلع متصلة وما توقف.
- **الكيرف:** استخدم نفس الكيرف على كل الكيفريمات، مثلاً (0.84, 0, 0.16, 1)، و60 فريم.
- **تعديلاتك محفوظة:** لا تخلي Claude يبني المشروع من جديد بعد ما تعدّل فيه بنفسك. اطلب منه يعدّل اللاير اللي تبيه بس.

## الحقوق
مبنية على الأداة مفتوحة المصدر **[Dakkshin/after-effects-mcp](https://github.com/Dakkshin/after-effects-mcp)** برخصة MIT. ملف الرخصة الأصلي موجود في [`LICENSE`](LICENSE) وداخل مجلد `after-effects-mcp`.

</div>
