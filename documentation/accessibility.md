# Accessibility Check - ExpPs Homepage #

Tests mittels des ```axe``` Browser-Plugins und des ```Page Structure``` Plugins.

- ```index.html```

   - Kontrast des Buttons des Helpdesks ACDH-CH nicht ausreichend.
   - Navigationsbilder (3x) enthalten keinen wahrnehmbaren Text (kein Inhalt für Screenreader).
   - Headings: h1 - h5 - h4

- ```manuscripts.html```
  
   - Kontrast des Buttons des Helpdesks ACDH-CH nicht ausreichend.
   - Headings: h1 - h3 - h5

- ```search.html```
   
   - Farbkontrast des ```Submit``` Buttons nicht ausreichend.
   - ```Select``` Elemente haben keinen zugänglichen Namen.
   - Headings: h1 - h3
   
- ```new_findings.html```

   - Kontrast des Buttons des Helpdesks ACDH-CH nicht ausreichend.
   - Headings: h1 - h3 - h2 - h4
   
- ```news.html```

   - Kontrast des Buttons des Helpdesks ACDH-CH nicht ausreichend.
   - Headings: h3 - h1 - h3 - h5
   
- ```team.html```

   - Kontrast des Buttons des Helpdesks ACDH-CH nicht ausreichend.
   - Headings: h1 - h3 - h3 - h3 - h3 - h3 - h1 - h3

- ```edition.html```

   - Schaltflächen müssen wahrnehmbaren Text beinhalten; betrifft Navigationsbutton links oben.
   - ```html``` Element muss ein ```lang``` Attribute tragen.
   - Links müssen wahrnehmbaren Text beinhalten.
   - Kontrast des Buttons des Helpdesks ACDH-CH nicht ausreichend.
   - Headings: h3 - h6
   
- ```about-transcription.html```

   - Kontrast des Buttons des Helpdesks ACDH-CH nicht ausreichend.
   - Headings: h1 - h5
   
- ```about-links.html```

   - Kontrast des Buttons des Helpdesks ACDH-CH nicht ausreichend.
   - Headings: h1 - h3
   
- ```access.html```

   - Kontrast der Aufzählung der API Endpoints nicht ausreichend (Orange auf Weiß).
   
- ```encoding.html```

   - Kontrast in den Codebeispielen mitunter nicht ausreichend.
   - Headings: h1 - h3 - h2
   
- ```bodl_auct_d_4_1.html``` - Transkriptionen

   - ```html``` Element muss ein ```lang``` Attribut tragen.
   - Kontrast des Buttons des Helpdesks ACDH-CH nicht ausreichend.
   - Headings: fehlen
   
# Sonstige ToDos #

- ACDH-CH im Footer: Adresse korrigieren; E-Mail Adresse korrigieren
- FWF-Logo aktualisieren

# Korrekturen - 29.01.2025 #

- ```index.html```

   - Automatische Checks: ok
   - Überschriften: ok
   
- ```manuscript.html```

   - Automatische Checks: ok
   - Überschriften: ok
   
- ```search.html```

   - Automatische Checks: ok
   - Überschriften: ok
   
- ```new_findings.html```

   - Automatische Checks: ok
   - Überschriften: ok
   
- ```news.html```

   - Automatische Checks: ok
   - Überschriften: ok
   
- ```team.html```

   - Automatische Checks: ok
   - Überschriften: ok
   
- ```about-transcription.html```

   - Automatische Checks: ok
   - Überschriften: ok
   
- ```about-links.html```

   - Automatische Checks: ok
   - Überschriften: ok
   
- ```encoding.html```

   - Der Farbkontrast in den Codebeispielen ist manchmal nicht ausreichend. Da es sich um automatisch generierte Farben handelt, werden diese Fehler nicht behoben.
   - Überschriften: ok
  
- ```access.html```

   - Automatische Checks: ok
   - Überschriften: ok
   
- ```edition.html```

   - Zum Navigationsbutton ```title``` Element hinzugefügt.
   - Fehler in Quelldatei: Expositio 60a: leeres ```ref``` Element.
   
- Handschriftenpräsentationen

   - Links zu Facsimiles nun mit ```title``` Attribut.
   
- Sonstiges

   - FWF-Logo aktualisiert
   - Adresse ACDH-CH korrigiert
