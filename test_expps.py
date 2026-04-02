import re
from playwright.sync_api import Page, expect

def test_has_title_start_page(page: Page):
    page.goto("https://expps.acdh.oeaw.ac.at/expps/index.html")

    # Expect the title of the start page to contain the string "Expositiones in Psalmos".
    expect(page).to_have_title(re.compile("Expositiones in Psalmos"))

def test_get_home_link(page: Page):
    page.goto("https://expps.acdh.oeaw.ac.at/expps/index.html")

    # Click the "Home" link.
    page.get_by_role("link", name="Home").click()

    # Expect the start page to have a particular URL.
    expect(page).to_have_url(re.compile("https://expps.acdh.oeaw.ac.at/expps/index.html"))

    # Expect the start page to have title "Expositiones in Psalmos".
    expect(page).to_have_title(re.compile("Expositiones in Psalmos"))

    # Expect the page with the heading "Expositiones in Psalmos" to be visible.
    expect(page.get_by_role("heading", name="Expositiones in Psalmos")).to_be_visible()

def test_get_manuscripts_link(page: Page):
    page.goto("https://expps.acdh.oeaw.ac.at/expps/index.html")

    # Click the "Manuscripts" link.
    page.get_by_role("link", name="Manuscripts").click()

    # Expect the manuscripts page to have a particular URL.
    expect(page).to_have_url(re.compile("https://expps.acdh.oeaw.ac.at/expps/manuscripts.html"))

    # Expect the page with the heading "... Manuscripts ..." to be visible.
    expect(page.get_by_role("heading", name="(Ps.)-Athanasius, Expositiones in Psalmos - Leading Catena Manuscripts")).to_be_visible()

def test_get_edition_first_part_link(page: Page):

    page.goto("https://expps.acdh.oeaw.ac.at/expps/index.html")

    # Click the "Edition" link and select "Edition: Ps 1-25".
    page.get_by_role("link", name="Edition").click()
    page.get_by_role("link", name="Edition: Ps 1-25").click()

    # Expect the edition, first part, page to have a particular URL.
    expect(page).to_have_url(re.compile("https://expps.acdh.oeaw.ac.at/expps/edition.html"))

    # Expect the page with the heading "... Edition ..." to be visible.
    expect(page.get_by_text("(Ps.)-Athanasius, Expositiones in Psalmos").and_(page.get_by_role("paragraph"))).to_be_visible()

def test_get_edition_second_part_link(page: Page):

    page.goto("https://expps.acdh.oeaw.ac.at/expps/index.html")

    # Click the "Edition" link and select "Edition: Ps 26-50".
    page.get_by_role("link", name="Edition").click()
    page.get_by_role("link", name="Edition: Ps 26-50").click()

    # Expect the edition, first part, page to have a particular URL.
    expect(page).to_have_url(re.compile("https://expps.acdh.oeaw.ac.at/expps/edition-part-two.html"))

    # Expect the page with the heading "... Edition ..." to be visible.
    expect(page.get_by_text("(Ps.)-Athanasius, Εxpositiones in Psalmos. Ps 26–50").and_(page.get_by_role("paragraph"))).to_be_visible()

def test_get_new_findings_link(page: Page):
    page.goto("https://expps.acdh.oeaw.ac.at/expps/index.html")

    # Click the "New Findings" link.
    page.get_by_title("New-Findings").click()

    # Expect the "New Findings" page to have a particular URL.
    expect(page).to_have_url(re.compile("https://expps.acdh.oeaw.ac.at/expps/new_findings.html"))

    # Expect the "New Findings" page to be visible.
    expect(page.get_by_role("heading", level=1, name="New Findings")).to_be_visible()

def test_get_search_link(page: Page):
    page.goto("https://expps.acdh.oeaw.ac.at/expps/index.html")

    # Click the "Search" link.
    page.get_by_role("link", name="Search").nth(1).click()

    # Expect the "Search" page to have a particular URL.
    expect(page).to_have_url(re.compile("https://expps.acdh.oeaw.ac.at/expps/search.html"))

    # Expect the "Search" page to be visible.
    expect(page.get_by_role("heading", level=1, name="Search")).to_be_visible()

def test_get_team_link(page: Page):
    page.goto("https://expps.acdh.oeaw.ac.at/expps/index.html")

    # Click the "Team" link.
    page.get_by_role("link", name="Team").click()

    # Expect the "Team" page to have a particular URL.
    expect(page).to_have_url(re.compile("https://expps.acdh.oeaw.ac.at/expps/team.html"))

    # Expect the "Team" page to be visible.
    expect(page.get_by_role("heading", level=1, name="Project members and contact:")).to_be_visible()

def test_get_news_link(page: Page):
    page.goto("https://expps.acdh.oeaw.ac.at/expps/index.html")

    # Click the "News" link.
    page.get_by_role("link", name="News").click()

    # Expect the "News" page to have a particular URL.
    expect(page).to_have_url(re.compile("https://expps.acdh.oeaw.ac.at/expps/news.html"))

    # Expect the "News" page to be visible.
    expect(page.get_by_role("heading", level=1, name="(Ps.)-Athanasius, Expositiones in Psalmos. Psalm 1 - 25. Athanasisus-Werke.")).to_be_visible()

def test_get_about_transcriptions_link(page: Page):
    page.goto("https://expps.acdh.oeaw.ac.at/expps/index.html")

    # Click the "About the Transcriptions" link.
    page.get_by_role("link", name="About").click()
    page.get_by_title("About Transcriptions").click()

    # Expect the "About the Transcriptions" page to have a particular URL.
    expect(page).to_have_url(re.compile("https://expps.acdh.oeaw.ac.at/expps/about-transcription.html"))

    # Expect the "About the Transcriptions" page to be visible.
    expect(page.get_by_role("heading", level=1, name="About the transcriptions:")).to_be_visible()

def test_get_about_links_link(page: Page):
    page.goto("https://expps.acdh.oeaw.ac.at/expps/index.html")

    # Click the "About Links" link.
    page.get_by_role("link", name="About").click()
    page.get_by_title("About Links").click()

    # Expect the "About Links" page to have a particular URL.
    expect(page).to_have_url(re.compile("https://expps.acdh.oeaw.ac.at/expps/about-links.html"))

    # Expect the "About Links" page to be visible.
    expect(page.get_by_role("heading", level=1, name="Links to transcribed manuscripts and to the TEI sources:")).to_be_visible()

def test_search_page_start_values(page: Page):
    page.goto("https://expps.acdh.oeaw.ac.at/expps/search.html")

    # Expect the start value in field "Select manuscript" to be "Vat. gr. 754".
    expect(page.locator("#name-of-manuscript-select-form-commentaryfragments")).to_have_text(re.compile("Vat. gr. 754"))

    # Expect the values in field "Select manuscript" to conform to the given list.
    expect(page.locator("#name-of-manuscript-select-form-commentaryfragments > option")).to_have_text(["Vat. gr. 754", "Mediolan. Ambros. M. 47 sup.", "Mediolan. Ambros. B. 106 sup.", "Paris. Coislin 187", "Oxon. Bodl. Auct. D. 4.1", "Paris. Coislin 10", "Paris. Coislin 12", "Genuensis Urbanus 3", "Mosq. Synod. 194", "Oxon. Coll. S. Trin. 78", "Paris. gr. 139", "Paris. gr. 164", "Paris. gr. 166-167", "Flor. Med. Laurent. Plut. 5.30", "Flor. Med. Laurent. Plut. 6.3", "Vat. gr. 1422"])

    # Expect the start value in field "Select author" to be "empty".
    expect(page.locator("#input-attribution-form-commentaryfragments")).to_have_text(re.compile("empty"))

    # Expect the value in field "Select author" to contain "Theodoretus" (This means the API call was successful).
    expect(page.locator("#input-attribution-form-commentaryfragments > option").nth(3)).to_have_text(re.compile("Theodoretus"))

    # Expect the start value in field "Select author critical" to be "empty".
    expect(page.locator("#input-author-critical-form-commentaryfragments")).to_have_text(re.compile("empty"))

    # Expect the value in field "Select author critical" to contain "Athanasius Alexandrinus - Athanasius, exp." (This means the API call was successful).
    expect(page.locator("#input-author-critical-form-commentaryfragments > option").nth(1)).to_have_text(re.compile("Athanasius Alexandrinus - Athanasius, exp."))

    # Expect the start value in field "Psalmverse" to be "empty".
    expect(page.locator("#psalmverse-form-commentaryfragments")).to_have_text(re.compile("empty"))

    # Expect the value in field "Psalmverse" to contain "Ps (LXX) 1,1" (This means the API call was successful).
    expect(page.locator("#psalmverse-form-commentaryfragments > option").nth(1)).to_have_text("Ps (LXX) 1,1")

def test_search_page_search_result(page: Page):
    page.goto("https://expps.acdh.oeaw.ac.at/expps/search.html")

    page.locator("#name-of-manuscript-select-form-commentaryfragments").select_option("Vat. gr. 754")
    page.locator("#input-attribution-form-commentaryfragments").select_option("(Athanasius)")
    page.locator("#psalmverse-form-commentaryfragments").select_option("Ps (LXX) 1,2")

    page.get_by_role("button", name="Submit").click()

    expect(page.locator("#search-result-content > div > a#vat-gr-754-fr-1-3")).to_have_text("(Athanasius) - Athanasius, exp. in Ps 1,2a")