\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \tempoMarkup "Presto" \autoBeamOff
    a'2. a4
    c2 h4 e~
    e d c2
    h a8[ h] c4~
    c8[ a c d] e2
    e, r
  }
}

SopranoLyrics = \lyricmode {
  Ho -- mo
  qui -- dam fe --
  cit coe --
  nam ma -- _
  _
  gnam,
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \tempoMarkup "Presto" \autoBeamOff
    R1
    e2. e4
    f2 e4 a~
    a g f2
    e4 a2 gis8[ fis]
    gis2 a
  }
}

AltoLyrics = \lyricmode {
  Ho -- mo
  qui -- dam fe --
  cit coe --
  nam ma -- _
  _ gnam,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \tempoMarkup "Presto" \autoBeamOff
    R1*3
    r2 r4 a~
    a a c2
    h4 e2 d4
  }
}

TenoreLyrics = \lyricmode {
  Ho --
  mo qui --
  dam fe -- cit
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Presto" \autoBeamOff
    R1*4
    r2 r4 e~
    e e f2
  }
}

BassoLyrics = \lyricmode {
  Ho --
  mo "qui -"
}

Organo = {
  \relative c {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Presto"
    a''2. a4
    << {
      c2 h4 e~
      e d c2
      h a8[ h]
    } \\ {
      e,2. e4
      f2 e4 a~
      a g f
    } >> \clef tenor a,~
    a a c \clef bass e,~
    e e f2
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r2. <6>4
  <5>2 <6>4 <6 _+>
  <5 \t>2 <7>4 <6>
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "S" "vl 1" }
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "A" "vl 2" }
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
