Sub CreateBunkerPresentation()
'
' CreateBunkerPresentation Macro
' Erstellt eine PowerPoint-Präsentation über Bunker des 2. Weltkriegs in Berlin
' Aufgeteilt nach Ost- und Westbunker (20 Folien total)
'

    Dim objPresentation As Object
    Dim objSlide As Object
    Dim objShape As Object
    Dim slideLayout As Object
    Dim slideNumber As Integer

    ' PowerPoint-Anwendung aktivieren/erstellen
    Set objPresentation = CreateObject("PowerPoint.Application").Presentations.Add

    With objPresentation
        .PageSetup.SlideWidth = 960
        .PageSetup.SlideHeight = 720
    End With

    ' Titelfolie
    Set objSlide = objPresentation.Slides.Add(1, 1) ' Layout 1 = Title Slide
    With objSlide.Shapes.Title
        .TextFrame.Text = "Bunker des Zweiten Weltkriegs in Berlin"
    End With
    With objSlide.Shapes(2)
        .TextFrame.Text = "Eine historische Übersicht: Ost- und Westbunker" & vbCrLf & vbCrLf & "2026"
    End With

    ' ===== WESTBUNKER (Folien 2-11) =====
    slideNumber = 2

    ' Folie 2: Westbunker - Einleitung
    Set objSlide = objPresentation.Slides.Add(slideNumber, 2)
    AddTitleAndContent objSlide, "Westbunker Berlins - Überblick", _
        "• Gebaut während der Luftanschläge der Alliierten" & vbCrLf & _
        "• Konzentriert im Bezirk Tiergarten und Charlottenburg" & vbCrLf & _
        "• Dienen als Luftschutzbunker und Führungsbunker" & vbCrLf & _
        "• Mehrgeschossige unterirdische Anlagen"
    slideNumber = slideNumber + 1

    ' Folie 3: Der Führerbunker (Vorbunker)
    Set objSlide = objPresentation.Slides.Add(slideNumber, 2)
    AddTitleAndContent objSlide, "Der Vorbunker (Führerbunker)", _
        "• Erbaut 1934 als Luftschutzbunker des Reichspräsidenten" & vbCrLf & _
        "• Tiefe: ca. 13 Meter unter der Erde" & vbCrLf & _
        "• Mehrere Ebenen mit verschiedenen Funktionen" & vbCrLf & _
        "• Später Sitz von Hitlers Stab"
    slideNumber = slideNumber + 1

    ' Folie 4: Der Führerbunker (Tiefbunker)
    Set objSlide = objPresentation.Slides.Add(slideNumber, 2)
    AddTitleAndContent objSlide, "Der Tiefbunker (Neuer Führerbunker)", _
        "• Erbaut 1941-1943 unter dem Reichskanzleigarten" & vbCrLf & _
        "• Tiefe: ca. 16 Meter unter der Erde" & vbCrLf & _
        "• Unterirdische Straße mit mehreren Komplexen" & vbCrLf & _
        "• Hitler verbrachte hier seine letzten Tage im April/Mai 1945"
    slideNumber = slideNumber + 1

    ' Folie 5: Schutzbunker Anhalter Bahnhof
    Set objSlide = objPresentation.Slides.Add(slideNumber, 2)
    AddTitleAndContent objSlide, "Schutzbunker Anhalter Bahnhof", _
        "• Großer Luftschutzbunker unter dem Bahnhof" & vbCrLf & _
        "• Mehrgeschossig mit großer Kapazität" & vbCrLf & _
        "• Bis zu 3.000 Personen konnten Schutz suchen" & vbCrLf & _
        "• Heute teilweise erhalten und zugänglich"
    slideNumber = slideNumber + 1

    ' Folie 6: Schutzbunker Zoo
    Set objSlide = objPresentation.Slides.Add(slideNumber, 2)
    AddTitleAndContent objSlide, "Schutzbunker Zoo (Flakturm)", _
        "• Flakturm im Tiergarten zur Luftverteidigung" & vbCrLf & _
        "• Kombiniert mit Schutzraum für die Bevölkerung" & vbCrLf & _
        "• Imposante Betonkonstruktion, 40 Meter hoch" & vbCrLf & _
        "• Eines der letzten erhaltenen Kriegsrelikte"
    slideNumber = slideNumber + 1

    ' Folie 7: Reichskanzlei-Bunker
    Set objSlide = objPresentation.Slides.Add(slideNumber, 2)
    AddTitleAndContent objSlide, "Reichskanzlei-Bunker", _
        "• Teil des Regierungskomplexes" & vbCrLf & _
        "• Mehrere Schutzbunker unter den Gebäuden" & vbCrLf & _
        "• Verbunden mit dem Tiefbunker-System" & vbCrLf & _
        "• Zentrum der Macht bis zum Kriegsende"
    slideNumber = slideNumber + 1

    ' Folie 8: Schutzbunker Friedrichstraße
    Set objSlide = objPresentation.Slides.Add(slideNumber, 2)
    AddTitleAndContent objSlide, "Schutzbunker Friedrichstraße", _
        "• U-Bahn-Bunker in der Innenstadt" & vbCrLf & _
        "• Umgebaut zu Schutzraum für die Bevölkerung" & vbCrLf & _
        "• Strategisch wichtiger Ort" & vbCrLf & _
        "• Teil eines ausgedehnten U-Bahn-Netzwerks"
    slideNumber = slideNumber + 1

    ' Folie 9: Schutzbunker Kleistpark
    Set objSlide = objPresentation.Slides.Add(slideNumber, 2)
    AddTitleAndContent objSlide, "Schutzbunker Kleistpark (Charlottenburg)", _
        "• Großer Luftschutzbunker in Charlottenburg" & vbCrLf & _
        "• Mehrere Ebenen unter Parkanlage" & vbCrLf & _
        "• Kapazität für mehrere hundert Personen" & vbCrLf & _
        "• Heute denkmalgeschützt"
    slideNumber = slideNumber + 1

    ' Folie 10: Weitere Westbunker
    Set objSlide = objPresentation.Slides.Add(slideNumber, 2)
    AddTitleAndContent objSlide, "Weitere Westbunker", _
        "• Schutzbunker Potsdamer Platz" & vbCrLf & _
        "• Bunker der Universität (Charlottenburg)" & vbCrLf & _
        "• Wehrmacht-Bunker in Spandau" & vbCrLf & _
        "• Diverse kleine Schutzbunker im Stadtgebiet"
    slideNumber = slideNumber + 1

    ' Folie 11: Luftschutzmaßnahmen West
    Set objSlide = objPresentation.Slides.Add(slideNumber, 2)
    AddTitleAndContent objSlide, "Luftschutzmaßnahmen - Westberlin", _
        "• Nach 1943: Intensivierung der Bombenschutzmaßnahmen" & vbCrLf & _
        "• Teilweise private Bunker und Keller" & vbCrLf & _
        "• Flächendeckendes Bunkernetzsystem angestrebt" & vbCrLf & _
        "• Viele improvisierte Schutzräume in Kellern"
    slideNumber = slideNumber + 1

    ' ===== OSTBUNKER (Folien 12-21) =====

    ' Folie 12: Ostbunker - Einleitung
    Set objSlide = objPresentation.Slides.Add(slideNumber, 2)
    AddTitleAndContent objSlide, "Ostbunker Berlins - Überblick", _
        "• Konzentriert im Bezirk Mitte und Friedrichshain" & vbCrLf & _
        "• Militärische Kommandozentralen und Luftschutzbunker" & vbCrLf & _
        "• Weniger repräsentativ als Westbunker" & vbCrLf & _
        "• Später unter sowjetischer Kontrolle"
    slideNumber = slideNumber + 1

    ' Folie 13: Bendlerblock-Bunker
    Set objSlide = objPresentation.Slides.Add(slideNumber, 2)
    AddTitleAndContent objSlide, "Bendlerblock-Bunker", _
        "• Sitz des Oberkommandos der Wehrmacht" & vbCrLf & _
        "• Umfangreiches Bunker- und Stollensystem" & vbCrLf & _
        "• Mehrere Geschosse unter Straßenniveau" & vbCrLf & _
        "• Zentrum deutscher Militäroperationen"
    slideNumber = slideNumber + 1

    ' Folie 14: Luftwaffen-Bunker Mitte
    Set objSlide = objPresentation.Slides.Add(slideNumber, 2)
    AddTitleAndContent objSlide, "Luftwaffen-Bunker (Mitte)", _
        "• Luftwaffen-Kommandozentrale" & vbCrLf & _
        "• Rundbunker mit Flakanlage" & vbCrLf & _
        "• Kontrollzentrum für Luftverteidigung" & vbCrLf & _
        "• Teil des militärischen Verteidigungssystems"
    slideNumber = slideNumber + 1

    ' Folie 15: Schutzbunker Ostkreuz
    Set objSlide = objPresentation.Slides.Add(slideNumber, 2)
    AddTitleAndContent objSlide, "Schutzbunker Ostkreuz (Friedrichshain)", _
        "• U-Bahn-Bunker unter dem Bahnhof" & vbCrLf & _
        "• Umgebaut zu Luftschutzbunker" & vbCrLf & _
        "• Tragische Geschichte: Bombardierung und Zerstörung" & vbCrLf & _
        "• Hunderte Tote bei Bombenschaden 1945"
    slideNumber = slideNumber + 1

    ' Folie 16: Marinebunker und Marinekommandos
    Set objSlide = objPresentation.Slides.Add(slideNumber, 2)
    AddTitleAndContent objSlide, "Marinebunker Spree/Rummelsburger Bucht", _
        "• Marinebunker für Kriegsmarine-Kommando" & vbCrLf & _
        "• Nahe den Wasserverkehrswegen" & vbCrLf & _
        "• Bunker für Torpedoentwicklung und Lagerung" & vbCrLf & _
        "• Strategischer Standort an der Spree"
    slideNumber = slideNumber + 1

    ' Folie 17: Gestapo-Bunker Prinz-Albrecht-Straße
    Set objSlide = objPresentation.Slides.Add(slideNumber, 2)
    AddTitleAndContent objSlide, "Gestapo und Sicherheitspolizei-Bunker", _
        "• Bunker unter Gestapo-Zentrale in Mitte" & vbCrLf & _
        "• Gefängnis- und Verhörräume" & vbCrLf & _
        "• Orte von Unterdrückung und Verbrechen" & vbCrLf & _
        "• Heute Dokumentationsstätte"
    slideNumber = slideNumber + 1

    ' Folie 18: Schutzräume in historischen Gebäuden
    Set objSlide = objPresentation.Slides.Add(slideNumber, 2)
    AddTitleAndContent objSlide, "Schutzräume in Ostberlin", _
        "• Keller unter Museen und Palästen als Bunker" & vbCrLf & _
        "• Reichstag-Keller als Schutzraum" & vbCrLf & _
        "• Schloss Charlottenburg (Westseite) Bunker" & vbCrLf & _
        "• Versteckte unterirdische Netzwerke"
    slideNumber = slideNumber + 1

    ' Folie 19: Sowjetische Übernahme der Bunker
    Set objSlide = objPresentation.Slides.Add(slideNumber, 2)
    AddTitleAndContent objSlide, "Nach 1945: Sowjetische Präsenz", _
        "• Russen übernahmen und untersuchten Bunker" & vbCrLf & _
        "• Viele Bunker wurden als Lager oder Gefängnisse genutzt" & vbCrLf & _
        "• Teilweise Sprengung und Zerstörung" & vbCrLf & _
        "• Archivierung von Kriegsdokumenten"
    slideNumber = slideNumber + 1

    ' Folie 20: Erhaltung und Museumsnutzung
    Set objSlide = objPresentation.Slides.Add(slideNumber, 2)
    AddTitleAndContent objSlide, "Bunker Heute - Denkmalschutz und Museen", _
        "• Viele Bunker unter Denkmalschutz" & vbCrLf & _
        "• Deutsche Bunkermuseen und Führungen" & vbCrLf & _
        "• Gedenkorte für Kriegsopfer" & vbCrLf & _
        "• Mahnmale und historische Dokumentation"
    slideNumber = slideNumber + 1

    ' Folie 21: Abschlussfolie
    Set objSlide = objPresentation.Slides.Add(slideNumber, 1)
    With objSlide.Shapes.Title
        .TextFrame.Text = "Conclusion"
    End With
    With objSlide.Shapes(2)
        .TextFrame.Text = "Die Bunker Berlins sind Zeugen der Geschichte" & vbCrLf & _
        "des Zweiten Weltkriegs und mahnen zur Erinnerung." & vbCrLf & vbCrLf & _
        "Heute sind sie wertvollen Dokumentationsstätten" & vbCrLf & _
        "für Bildung und Gedenken."
    End With

    ' Präsentation speichern
    Dim savePath As String
    savePath = ActivePresentation.Path & "\Bunker_WWII_Berlin.pptx"
    objPresentation.SaveAs savePath

    MsgBox "Präsentation erfolgreich erstellt: " & savePath, vbInformation, "Erfolg"

End Sub

' Hilfsfunktion zum Hinzufügen von Titel und Inhalt
Sub AddTitleAndContent(objSlide As Object, titleText As String, contentText As String)
    With objSlide.Shapes.Title
        .TextFrame.Text = titleText
    End With
    With objSlide.Shapes(2)
        .TextFrame.Text = contentText
        .TextFrame.WordWrap = True
    End With
End Sub
