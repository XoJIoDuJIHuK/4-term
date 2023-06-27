import {Busyness, Experience, Schedule} from "./actions/index";

export const enum Tags {
    jQuery = "jQuery",
    JavaScript = "JavaScript",
    CSS3 = "CSS3",
    React = "React",
    Git = "Git",
    Vue = "Vue",
    Flexbox = "Flexbox",
    HTML5 = "HTML5",
}

type Job = {
    id: number,
    title: string,
    companyName: string,
    location: string,
    date: string,
    isFavourite: boolean,
    imgSrc: string,
    description: string,
    minSalary: number,
    maxSalary: number,
    isSelected: false,
    schedule: Schedule,
    busyness: Busyness,
    experience: Experience,
    tags: Tags[]
}

export const JobsData: Job[] = [
    {
        id: 1,
        title: "Front-end Разработчик",
        companyName: "Интернет Люди",
        location: "Москва",
        date: "29/03/2021",
        isFavourite: true,
        imgSrc: `./../images/1.png`,
        description: "Интернет Люди - IT-компания, создающая проекты в сфере iGaming. Мы разрабатываем высоконагруженные системы с использованием Ruby on Rails, Vue.js, PHP и Go, а также управляем трафикообразованием и лидогенерацией.\n" + "Какие продукты мы создаем?\n" + "Крупные развлекательные онлайн-проекты и приложения для iOS и Android.\n" + "Чем предстоит заниматься:\n" +
            "\n" +
            "разработкой пользовательских интерфейсов на Vue.js;\n" +
            "проектированием архитектурных решений новых сервисов, библиотек;\n" +
            "интеграцией с Back-end;\n" +
            "взаимодействием с менеджерами, дизайнером, back-end разработчиками, QA-инженерами;\n" +
            "контролем качества кода, code-review, написанием тестов;\n" +
            "поддержанием клиентских и внутренних проектов компании.\n" +
            "Нам нужен именно ты, если у тебя есть:\n" +
            "\n" +
            "прекрасное знание JavaScript (ES6, области видимости и замыкания, классы, контексты, промисы);\n" +
            "опыт работы с Vue, React, Angular от 4-х лет;\n" +
            "уверенные знания HTML5 и CSS3;\n" +
            "опыт работы с Git, продуктами Atlassian (Jira);\n" +
            "опыт написания тестов (jest, vue-test-utils).\n" +
            "Будет весомым преимуществом:\n" +
            "\n" +
            "наличие open-source проектов (присылайте проекты или профили на GitHub);\n" +
            "опыт использования TypeScript;\n" +
            "умение писать красивый, эффективный и поддерживаемый код в соответствии со style guide.\n" +
            "Наш стек:\n" +
            "\n" +
            "Javascript, vue, vuex, react, redux, html, scss, webpack, lerna.\n" +
            "\n" +
            "Мы предлагаем:\n" +
            "\n" +
            "работу в молодом и дружном коллективе;\n" +
            "\n" +
            "безграничные возможности для профессионального роста и самореализации;\n" +
            "\n" +
            "комфортное рабочее место в современном офисе с террасой в центральной части города;\n" +
            "\n" +
            "оборудованную кухню с кофе, орехами, свежими фруктами и прочими вкусняшками;\n" +
            "\n" +
            "современное техническое оснащение (мощное железо, дополнительные мониторы, и все, что нужно для работы);\n" +
            "\n" +
            "курсы английского языка;\n" +
            "\n" +
            "бесплатную парковку рядом с офисом;\n" +
            "\n" +
            "3 sick days;\n" +
            "\n" +
            "интересные корпоративные мероприятия.",
        minSalary: 30000,
        maxSalary: undefined,
        isSelected: false,
        schedule: Schedule.FULL_DAY,
        busyness: Busyness.TRAINEE,
        experience: Experience.FOURTH,
        tags: [
            Tags.jQuery,
            Tags.JavaScript,
            Tags.CSS3,
            Tags.React,
            Tags.Git,
            Tags.Vue,
            Tags.Flexbox,
            Tags.HTML5,
        ]
    },
    {
        id: 2,
        title: "React Developer (Middle/Senior)",
        companyName: "GOOD CALL DEVELOPMENT",
        location: "Москва",
        date: "29/03/2021",
        isFavourite: false,
        imgSrc: `./images/2.png`,
        description: "Мы тех стартап, ищем талантливого Full Stack Разработчика в нашу команду.\n" +
            "\n" +
            "Вашей основной обязанностью будет проектирование и разработка headless e-commerce.\n" +
            "\n" +
            "Важно\n" +
            "\n" +
            "Владение React, Angular или Vue\n" +
            "Хорошие знания Wordpress или других ecommerce платформ\n" +
            "HTML/CSS верстка с использованием CSS препроцессоров и Webpack\n" +
            "RESTful APIs\n" +
            "Базы данных\n" +
            "GIT\n" +
            "Docker +\n" +
            "Ты нам подходишь, если:\n" +
            "\n" +
            "Ты любишь то, что делаешь\n" +
            "Опыт работы с React или другими фреймворками 3+\n" +
            "Тебе интересно менять мир, а не только получать зарплату\n" +
            "А что мы?\n" +
            "\n" +
            "Удаленная работа и гибкий график\n" +
            "Хорошая зп, бонусы, и опционы\n" +
            "Оплачиваемые курсы\n" +
            "Укажите ссылку на свой Github профиль в сопроводительном письме. Без ссылки ваша заявка может быть дисквалифицирована.",
        minSalary: 200000,
        maxSalary: undefined,
        isSelected: false,
        schedule: Schedule.FULL_DAY,
        busyness: Busyness.TRAINEE,
        experience: Experience.FOURTH,
        tags: [
            Tags.jQuery,
            Tags.JavaScript,
            Tags.CSS3,
            Tags.React,
            Tags.Git,
        ]
    },
    {
        id: 3,
        title: "Frontend developer (React)",
        companyName: "Winfinity",
        location: "Москва",
        date: "29/03/2021",
        isFavourite: false,
        imgSrc: `./images/3.png`,
        description: "Мы, Winfinity, занимаемся разработкой инновационных решений в области игорно-развлекательного контента.\n" +
            "\n" +
            "Для создания наших продуктов используются передовые технологии, среди которых: Computer Vision, Unreal Engine, Ultra Low Latency Video Streaming. У нас очень крутой и суперсовременный технопарк - от камер и света, до графических карт, которые почти невозможно найти.\n" +
            "\n" +
            "Сегодня мы на стадии активного развития. Мы создаём масштабный, технологически сложный и в тоже время очень интересный, глобальный проект - частью которого можете стать Вы!\n" +
            "\n" +
            "И если у Вас есть:\n" +
            "\n" +
            "опыт коммерческой разработки на JavaScript от 2 лет;\n" +
            "опыт коммерческой разработки на React от 2 лет;\n" +
            "опыт работы в команде с git;\n" +
            "опыт работы с любым сборщиком (webpack, gulp и т.д.).\n" +
            "…то Вы именно тот, кого мы ищем!\n" +
            "\n" +
            "Обязательные знания:\n" +
            "\n" +
            "Typescript;\n" +
            "Webpack;\n" +
            "Styled-components;\n" +
            "GraphQL;\n" +
            "Express;\n" +
            "MongoDB;\n" +
            "WebSockets;\n" +
            "Docker.\n" +
            "После испытательного срока мы предлагаем:\n" +
            "\n" +
            "возможную релокацию в столицу Латвии с помощью в оформлении всех необходимых документов;\n" +
            "бесплатную стоянку рядом с современным офисом в центре города;\n" +
            "медицинскую страховку;\n" +
            "абонемент в спортивный зал.\n" +
            "Наша сила - в отсутствии бюрократии, легаси кода, чайка менеджмента, бизнеса, который уже не знает, чего хочет.\n" +
            "\n" +
            "Мы за нестандартные идеи, профессиональный и творческий подход, отличные отношения в коллективе и результат.",
        minSalary: 150000,
        maxSalary: undefined,
        isSelected: false,
        schedule: Schedule.FULL_DAY,
        busyness: Busyness.FULL,
        experience: Experience.FIRST,
        tags: [
            Tags.jQuery,
            Tags.JavaScript,
        ]
    },
    {

        id: 4,
        title: "Frontend developer",
        companyName: "Diagnocat",
        location: "Минск",
        date: "29/03/2021",
        isFavourite: false,
        imgSrc: `./images/4.png`,
        description: "Diagnocat - компания разработки полного цикла мобильных и веб-приложений. Мы сотрудничаем с заказчиками из разных стран мира, наши проекты успешно реализованы в странах Западной Европы, США и Среднего Востока. Наши проекты из многих индустрий и разного уровня сложности, от небольших маркетплейсов и игр до сложных SaaS систем управлением бизнесом.\n" +
            "\n" +
            "И сейчас компания растет и мы ищем Front End Developer/ Full stack developer.\n" +
            "\n" +
            "\n" +
            "Обязанности:\n" +
            "\n" +
            "Разработка веб-приложений;\n" +
            "\n" +
            "Оптимизация процесса разработки.\n" +
            "\n" +
            "Участие в принятии архитектурных и технических решений по разработке программного обеспечения.\n" +
            "\n" +
            "Требования:\n" +
            "\n" +
            "Опыт работы не менее 2 лет\n" +
            "Опыт программирования React + React Native + TypeScript + JavaScript (ES6+) + CSS\n" +
            "Английский от В1;\n" +
            "Будет плюсом:\n" +
            "\n" +
            "Опыт работы Full stack developer\n" +
            "Мы предлагаем:\n" +
            "\n" +
            "Отсутствие бюрократии;\n" +
            "Зарплата привязана к доллару США;\n" +
            "Гибкий график работы (начиная с 9.00-11.00), возможность работать в офисе или удаленно;\n" +
            "Отпуск 25 календарных дней и 6 sick days;\n" +
            "Медицинская страховка;\n" +
            "Интересные проекты. Возможность внедрять и реализовать собственные идеи;\n" +
            "Современная техника необходимая для работы;\n" +
            "Офис в центре Минска, 5 мин. ходьбы от ст. м. Ковальская Слобода;\n" +
            "Совместные мероприятия, корпоративы и тимбилдинги.",
        minSalary: 200000,
        maxSalary: undefined,
        isSelected: false,
        schedule: Schedule.FULL_DAY,
        busyness: Busyness.FULL,
        experience: Experience.FIRST,
        tags: [
            Tags.jQuery,
            Tags.JavaScript,
            Tags.CSS3,
            Tags.React,
            Tags.Git,
            Tags.Vue,
            Tags.Flexbox,
            Tags.HTML5,
        ]
    },
]

type Image = {
    id: number,
    src: any
}

import img1 from "./images/1.png"
import img2 from "./images/2.png"
import img3 from "./images/3.png"
import img4 from "./images/4.png"

export const images: Image[] = [
    {src: img1, id: 1},
    {src: img2, id: 2},
    {src: img3, id: 3},
    {src: img4, id: 4},
]