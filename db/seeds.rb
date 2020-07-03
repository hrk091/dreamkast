# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


if Industry.all.length == 0
  puts "Adding industry list"
  Industry.create!(
    [
      { name: "IT関連製造業" },
      { name: "電気機器製造業" },
      { name: "通信機器関連製造業" },
      { name: "電子部品/デバイス/電子回路製造業" },
      { name: "自動車/輸送用機器製造業" },
      { name: "産業用/事務用機器製造業" },
      { name: "食料品/飲料製造業" },
      { name: "医薬品/化学製品製造" },
      { name: "素材関連製造業" },
      { name: "その他の製造業" },
      { name: "ソフトウェアベンダー" },
      { name: "受託開発/情報処理サービス" },
      { name: "組み込み系ソフトウェア" },
      { name: "データセンター事業者" },
      { name: "クラウド系ベンダー" },
      { name: "SaaS系ベンダー" },
      { name: "Webサイト制作" },
      { name: "Webマーケティング支援" },
      { name: "通信事業者" },
      { name: "インターネットサービスプロバイダ" },
      { name: "その他の情報サービス業" },
      { name: "発電事業者" },
      { name: "一般送配電事業者" },
      { name: "小売電気事業者" },
      { name: "ガス/水道業" },
      { name: "その他の公益事業関連" },
      { name: "商社/販社/卸" },
      { name: "小売/流通（IT関連製品外）" },
      { name: "金融（銀行/証券/保険など）" },
      { name: "運輸/郵便業" },
      { name: "放送/出版/メディア" },
      { name: "インターネット関連メディア" },
      { name: "旅行/ホテル/レジャー業" },
      { name: "商社/販社/卸" },
      { name: "外食業" },
      { name: "広告代理店/PR会社" },
      { name: "印刷/DTP" },
      { name: "広告制作/デザイン" },
      { name: "専門職（弁護士/公認会計士/税理士など）" },
      { name: "コンサルティング" },
      { name: "その他のサービス業" },
      { name: "映像/音楽産業" },
      { name: "医療/福祉/病院" },
      { name: "農林/水産/鉱業" },
      { name: "建設業" },
      { name: "住宅/不動産" },
      { name: "政府/官公庁/団体" },
      { name: "地方自治体" },
      { name: "学校/教育機関" },
      { name: "研究所（民間/公共）" },
      { name: "自営業/独立事業者" },
      { name: "学生" },
      { name: "勤めていない" },
      { name: "該当なし" },
    ]
  )
end

if TalkCategory.all.length == 0
  puts "Adding talk category list"
  TalkCategory.create!(
    [
      { name: "CI / CD"},
      { name: "Customizing / Extending"},
      { name: "IoT / Edge"},
      { name: "Microservices / Services Mesh"},
      { name: "ML / GPGPU / HPC"},
      { name: "Networking"},
      { name: "Operation / Monitoring / Logging"},
      { name: "Orchestration"},
      { name: "Runtime"},
      { name: "Security"},
      { name: "Serveless / FaaS"},
      { name: "Storage / Database"},
      { name: "Architecture Design"},
      { name: "Hybrid Cloud / Multi Cloud"},
      { name: "NFV / Edge"},
    ]
  )
end

if TalkDifficulty.all.length == 0
  puts "Adding talk difficulty list"
  TalkDifficulty.create!(
    [
      { name: "Beginner - 初級者"},
      { name: "Intermediate - 中級者"},
      { name: "Advanced - 上級者"},
    ]
  )
end

if Rails.env.development? && Talk.all.length == 0
  Talk.create!(
    [
      {
        title: "Keynote",
        abstract: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi egestas leo sit amet mauris placerat bibendum. Nulla egestas enim non eros mattis maximus. Curabitur faucibus sagittis condimentum. Nullam viverra accumsan tincidunt. Vivamus sollicitudin eros condimentum, mattis magna nec, mollis lorem. Vestibulum blandit facilisis fermentum. Nulla eget tortor in nibh rhoncus venenatis. Phasellus ipsum mauris, porttitor non varius sed, placerat sit amet lorem.",
        talk_category_id: 1,
        talk_difficulty_id: 1,
        track: "AllTrack",
        start_time: Time.parse("10:00"),
        end_time: Time.parse("10:40")
      },
      {
        title: "CI/CDに関する発表",
        abstract: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi egestas leo sit amet mauris placerat bibendum. Nulla egestas enim non eros mattis maximus. Curabitur faucibus sagittis condimentum. Nullam viverra accumsan tincidunt. Vivamus sollicitudin eros condimentum, mattis magna nec, mollis lorem. Vestibulum blandit facilisis fermentum. Nulla eget tortor in nibh rhoncus venenatis. Phasellus ipsum mauris, porttitor non varius sed, placerat sit amet lorem.",
        talk_category_id: 1,
        talk_difficulty_id: 1,
        track: "Track1",
        start_time: Time.parse("11:00"),
        end_time: Time.parse("11:40")
      },
      {
        title: "IoT/Edgeに関する10の知見",
        abstract: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi egestas leo sit amet mauris placerat bibendum. Nulla egestas enim non eros mattis maximus. Curabitur faucibus sagittis condimentum. Nullam viverra accumsan tincidunt. Vivamus sollicitudin eros condimentum, mattis magna nec, mollis lorem. Vestibulum blandit facilisis fermentum. Nulla eget tortor in nibh rhoncus venenatis. Phasellus ipsum mauris, porttitor non varius sed, placerat sit amet lorem.",
        talk_category_id: 1,
        talk_difficulty_id: 1,
        track: "Track1",
        start_time: Time.parse("13:00"),
        end_time: Time.parse("13:40")
      },
    {
        title: "CloudNative Networking",
        abstract: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi egestas leo sit amet mauris placerat bibendum. Nulla egestas enim non eros mattis maximus. Curabitur faucibus sagittis condimentum. Nullam viverra accumsan tincidunt. Vivamus sollicitudin eros condimentum, mattis magna nec, mollis lorem. Vestibulum blandit facilisis fermentum. Nulla eget tortor in nibh rhoncus venenatis. Phasellus ipsum mauris, porttitor non varius sed, placerat sit amet lorem.",
        talk_category_id: 1,
        talk_difficulty_id: 1,
        track: "Track1",
        start_time: Time.parse("14:00"),
        end_time: Time.parse("14:20")
      },
      {
        title: "Kubernetes Security Tips",
        abstract: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi egestas leo sit amet mauris placerat bibendum. Nulla egestas enim non eros mattis maximus. Curabitur faucibus sagittis condimentum. Nullam viverra accumsan tincidunt. Vivamus sollicitudin eros condimentum, mattis magna nec, mollis lorem. Vestibulum blandit facilisis fermentum. Nulla eget tortor in nibh rhoncus venenatis. Phasellus ipsum mauris, porttitor non varius sed, placerat sit amet lorem.",
        talk_category_id: 1,
        talk_difficulty_id: 1,
        track: "Track1",
        start_time: Time.parse("14:40"),
        end_time: Time.parse("14:20")
      },
      {
        title: "最強のCloudNative Architecture Design",
        abstract: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi egestas leo sit amet mauris placerat bibendum. Nulla egestas enim non eros mattis maximus. Curabitur faucibus sagittis condimentum. Nullam viverra accumsan tincidunt. Vivamus sollicitudin eros condimentum, mattis magna nec, mollis lorem. Vestibulum blandit facilisis fermentum. Nulla eget tortor in nibh rhoncus venenatis. Phasellus ipsum mauris, porttitor non varius sed, placerat sit amet lorem.",
        talk_category_id: 1,
        talk_difficulty_id: 1,
        track: "Track3",
        start_time: Time.parse("10:00"),
        end_time: Time.parse("10:50")
      },
      {
        title: "Container Runtime徹底比較",
        abstract: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi egestas leo sit amet mauris placerat bibendum. Nulla egestas enim non eros mattis maximus. Curabitur faucibus sagittis condimentum. Nullam viverra accumsan tincidunt. Vivamus sollicitudin eros condimentum, mattis magna nec, mollis lorem. Vestibulum blandit facilisis fermentum. Nulla eget tortor in nibh rhoncus venenatis. Phasellus ipsum mauris, porttitor non varius sed, placerat sit amet lorem.",
        talk_category_id: 1,
        talk_difficulty_id: 1,
        track: "Track3",
        start_time: Time.parse("11:00"),
        end_time: Time.parse("11:50")
      }
    ]
  )
end

if Rails.env.development? && Speaker.all.length == 0
  Speaker.create!(
    [
      {
        id: 1,
        name: "高石 諒",
        profile: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi egestas leo sit amet mauris placerat bibendum. Nulla egestas enim non eros mattis maximus. Curabitur faucibus sagittis condimentum. Nullam viverra accumsan tincidunt. Vivamus sollicitudin eros condimentum, mattis magna nec, mollis lorem. Vestibulum blandit facilisis fermentum. Nulla eget tortor in nibh rhoncus venenatis. Phasellus ipsum mauris, porttitor non varius sed, placerat sit amet lorem.",
        company: "GMO Pepabo, inc.",
        job_title: "Software Engineer",
        twitter_id: "r_takaishi",
        github_id: "takaishi",
      },
      {
        id: 2,
        name: "講演し太郎2",
        profile: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi egestas leo sit amet mauris placerat bibendum. Nulla egestas enim non eros mattis maximus. Curabitur faucibus sagittis condimentum. Nullam viverra accumsan tincidunt. Vivamus sollicitudin eros condimentum, mattis magna nec, mollis lorem. Vestibulum blandit facilisis fermentum. Nulla eget tortor in nibh rhoncus venenatis. Phasellus ipsum mauris, porttitor non varius sed, placerat sit amet lorem.",
        company: "株式会社シー・エフ・ピー",
        job_title: "Infrastructure Engineer",
        twitter_id: "",
        github_id: "",
      },
      {
        id: 3,
        name: "講演し太郎3",
        profile: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi egestas leo sit amet mauris placerat bibendum. Nulla egestas enim non eros mattis maximus. Curabitur faucibus sagittis condimentum. Nullam viverra accumsan tincidunt. Vivamus sollicitudin eros condimentum, mattis magna nec, mollis lorem. Vestibulum blandit facilisis fermentum. Nulla eget tortor in nibh rhoncus venenatis. Phasellus ipsum mauris, porttitor non varius sed, placerat sit amet lorem.",
        company: "株式会社シー・エフ・ピー",
        job_title: "Infrastructure Engineer",
        twitter_id: "",
        github_id: "",
      }
    ]
  )
end

if Rails.env.development? && TalksSpeaker.all.length == 0
  TalksSpeaker.create!(
    [
      {
        talk_id: 1,
        speaker_id: 1
      },
      {
        talk_id: 2,
        speaker_id: 2
      },
      {
        talk_id: 3,
        speaker_id: 3
      }
    ]
  )
end
