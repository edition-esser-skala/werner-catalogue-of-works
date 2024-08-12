\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Adagio"
    fis'4. g16 fis g4. fis16 e
    fis4. fis8 eis gis4 fis16 e
    d8 fis4 e16 d cis8 e~ e8.\trill d32 e
    fis8 fis fis fis e4 r
    r8 e4 d!8 cis8.\trill cis16 h4
    a8 d4 cis8 h4. h8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Adagio"
    a'4 d4. cis16 h cis4
    d8 a4 h8 cis2~
    cis8 d16 cis h4. cis16 h a4~
    a8 a a a gis4 r
    r8 e16 fis gis a h4 a gis8
    fis h16 a gis8 a4 gis16 fis gis4\trill
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    a'4^\tutti d4. cis16[ h] cis4
    d8 a4 h8 cis2~
    cis8[ d16 cis] h4. cis16[ h] a4~
    a8 a a a gis4 r
    r8 e'4 d!8 cis8. cis16 h4
    a8 d4 cis8 h4. h8
  }
}

SopranoLyrics = \lyricmode {
  San -- _ _ _
  ctus, san -- _ _
  _ _ _
  ctus Do -- mi -- nus
  De -- us Sa -- ba -- oth,
  De -- _ us Sa -- "ba -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    fis4.^\tutti g16[ fis] g4. fis16[ e]
    fis4 fis eis8 gis4 fis16[ e]
    d8 fis4 e16[ d] cis8 e4 d16[ e]
    fis8 fis fis fis e4 r
    r8 e16[ fis] gis[ a] h4 a gis8
    fis[ h16 a] gis8 a4 gis16[ fis] gis8.\trill gis16
  }
}

AltoLyrics = \lyricmode {
  San -- _ _ _
  ctus, san -- _ _ _
  _ _ _ _ _ _
  _ ctus Do -- mi -- nus
  De -- _ _ _ _
  _ _ _ us Sa -- "ba -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    a4.^\tutti h16[ a] h4 e
    a,8 d4 cis16[ h] a8[ gis] ais8.[\trill gis32 ais]
    h8[ fis] gis8.[\trill fis32 gis] a8[ e] fis4
    h4. h8 h e4 d!8
    cis8. cis16 h4 e4. h8
    cis4 h cis16[ d] e4 e8
  }
}

TenoreLyrics = \lyricmode {
  San -- _ _ _
  ctus, san -- _ _ _
  _ _ _ ctus
  Do -- mi -- nus De -- us
  Sa -- ba -- oth, De -- us,
  De -- _ us Sa -- "ba -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    d2^\tutti e
    d4 d cis fis
    h, e a, d
    dis4. dis8 e e16[ fis] gis[ a h8]~
    h[ a] gis4 r e~
    e e e4. e8
  }
}

BassoLyrics = \lyricmode {
  San -- _
  ctus, san -- _ _
  ctus, san -- _ ctus
  Do -- mi -- nus De -- _
  us, De --
  us Sa -- "ba -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Adagio"
    d2 e
    d cis4 fis
    h, e a, d
    dis2 e~-\tasto
    e1~
    e2~ e4 e,
  }
}

BassFigures = \figuremode {
  <5 3>4. <6 4>8 <7>4 <6>
  <5>4. <6>8 <8 6 _+> <\t 5\+ \t> <9\\ _+> <8 \t>
  <9> <8> <9 _+> <8 \t> <9> <8> <9> <8>
  <6 5>2 <_+>
  r1
  r2 <4>4 <_+>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
