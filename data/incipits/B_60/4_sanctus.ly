\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 3/4 \tempoMarkup "Andante"
    a'8 cis16 h cis8 d e e,
    a4. h8 cis h16 cis
    d8 e16 fis e8 h e d
    cis4. e16 d cis8 h
    a4. cis16 h a8 cis
    h4 h4. h8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 3/4 \tempoMarkup "Andante"
    r4 e gis
    r e8 fis16 gis a8 e
    fis16 gis a8 h gis4 a16 h
    e,4 e4. fis16 gis
    a8 fis a4. gis8
    fis e4 dis16 cis \hA dis4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 3/4 \autoBeamOff \tempoMarkup "Andante"
    a'8[^\tutti cis16 h] cis8[ d e e,]
    a4. h8 cis[ h16 cis]
    d8[ e16 fis] e8[ h e d]
    cis4 cis8[ e16 d] cis8[ h]
    a4. cis16[ h] a8[ cis]
    h4 h2
  }
}

SopranoLyrics = \lyricmode {
  San -- _
  _ _ _
  _ _
  ctus, san -- _
  _ _ _
  ctus, "san -"
}

Alto = {
  \relative c' {
    \clef alto
    \key a \major \time 3/4 \autoBeamOff \tempoMarkup "Andante"
    r4 e^\tutti gis
    r e8[ fis16 gis] a8[ e]
    fis16[ gis a8] h gis4 a16[ h]
    e,4 e4. fis16[ gis]
    a8[ fis] a4. gis8
    fis e4 dis16[ cis] \hA dis4
  }
}

AltoLyrics = \lyricmode {
  San -- ctus,
  san -- _
  _ _ _ _
  ctus, san -- _
  _ _ _
  ctus, san -- _ \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \major \time 3/4 \autoBeamOff \tempoMarkup "Andante"
    r4 a^\tutti h
    cis16[ h] cis4 d8 e4
    a,8[ d] h2
    cis4 a8[ cis16 h] a4~
    a8[ cis16 h] a8.[ h16] cis[ d e8]
    h gis fis2
  }
}

TenoreLyrics = \lyricmode {
  San -- ctus,
  san -- _ _ _
  ctus, san --
  ctus, san -- _
  _ _
  _ ctus, "san -"
}

Basso = {
  \relative c {
    \clef bass
    \key a \major \time 3/4 \autoBeamOff \tempoMarkup "Andante"
    r4 a'^\tutti gis
    fis8[ e16 d] cis8[ h] a4
    fis' gis2
    a4 a4. gis8
    fis[ a16 gis] fis4. e8
    dis e h2
  }
}

BassoLyrics = \lyricmode {
  San -- ctus,
  san -- _ _
  ctus, san --
  ctus, san -- _
  _ _ _
  _ ctus, "san -"
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 3/4 \tempoMarkup "Andante"
    a4-\tutti a' gis
    fis8 e16 d cis8 h << { a' gis } \\ { a,4 } >>
    fis' gis2
    a8 cis16 h a4. gis8
    fis a16 gis fis4. e8
    dis e h2
  }
}

BassFigures = \figuremode {
  r2.
  r
  <6>4 q2
  r2.
  r2 r8 q
  r4 <4> <_+>
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
