\version "2.24.2"
\include "header.ly"

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    r2 r4 d8^\solo fis
    e a, e'16[ fis] e[ fis] g4. g8
    fis4 gis8[ a16 \hA gis] a8 a g fis
    g[ h] a[ g] fis d fis e16[ d]
    a'4. a8 d,[ cis16 d] e4~
    e8 d r4 r2
  }
}

AltoLyrics = \lyricmode {
  Al -- ma
  Ma -- ter, Re -- dem -- pto -- ris
  Ma -- _ _ ter, Re -- dem --
  pto -- ris Ma -- ter, Re -- dem --
  pto -- ris Ma -- _
  ter,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    g4.^\solo h8 a d, a'16[ h] a[ h]
    c4. c8 h g h16[ c] h[ c]
    d4. c16[ h] c8 c h a
    h[ d] c[ h] a4 d,
    r2 r8 h' a a16 a
    a8 a a d c!2\trill
  }
}

TenoreLyrics = \lyricmode {
  Al -- ma Ma -- ter, Re -- dem --
  pto -- ris Ma -- ter, Re -- dem --
  pto -- ris Ma -- ter, Re -- dem --
  pto -- ris Ma -- ter,
  quae per -- vi -- a
  coe -- li por -- ta "ma -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    R1*3
    r2 d4.^\solo fis8
    e a, e'16[ fis] e[ fis] g8 g g4
    fis8 fis fis fis16 fis e8 e e a
  }
}

BassoLyrics = \lyricmode {
  Al -- ma %4
  Ma -- ter, Re -- dem -- pto -- ris Ma --
  ter, quae per -- vi -- a coe -- li por -- ta
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Largo"
    g'8-\solo^\aTre g, h g d'4 d,
    a' a' e e,
    h'8 h' e, e, a4 d
    g8 g, c4 d2
    cis4 a h \hA cis
    d4. d8 e4. a8
  }
}

BassFigures = \figuremode {
  r2 <4>4 <_+>
  r1
  r4 <7 _+>2 <6 4>8 <5 _+>
  r4 <6>8 <5> r2
  r4 <5>8 <6\\> <6>4 <6 5>
  <9>8 <8>4. <6>2
}

\score {
  <<
    \new ChoirStaff <<
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
