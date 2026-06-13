\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r2 d'4.^\solo^\aQuattro d8
    a4 a8 a b2
    b4 b a4. a8
    a4 d8[ c] b[ a] b4~
    b8 b a2 d8[ c]
    h4. h8 a2
  }
}

SopranoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui ve --
  nit in no -- mi --
  ne, in no -- _
  mi -- ne Do --
  _ mi -- ni.
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r2 fis4.^\solo^\aQuattro fis8
    fis fis fis4 g16[ \hA fis g8] g,4
    r g' e4. e8
    d4 d2 g8[ f!]
    e4. e8 e4 d~
    d cis8[ h] \hA cis2
  }
}

AltoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui ve -- nit
  in no -- mi --
  ne, in no --
  _ mi -- ne Do --
  mi -- ni.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    a4.^\solo^\aQuattro a8 a a a4
    d2 d4 d~
    d e cis cis
    d8[ c b a] g8. g16 g4
    a8[ g f e] f2~
    f4 f e2
  }
}

TenoreLyrics = \lyricmode {
  Be -- ne -- di -- ctus, qui
  ve -- nit, ve --
  _ nit in
  no -- _ mi -- ne
  Do -- _
  mi -- ni.
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r2 d4.^\solo^\aQuattro d8
    d4 d8 d g2
    g4 g2 a4
    fis fis g8[ f e d]
    cis4 cis8 cis d[ c b a]
    gis4. gis8 a2
  }
}

BassoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui ve --
  nit, ve -- _
  nit in no --
  _ mi -- ne Do --
  _ mi -- ni.
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Adagio"
    d4-\solo^\aQuattro r d4. d8
    d4 d g2
    g4 g2 a4
    fis2 g8 f e d
    cis2 d8 c b a
    gis2 a
  }
}

BassFigures = \figuremode {
  r2 <_+>
  r1
  r4 <6!> <4\+ 2> <\t \t>
  <6>2. <5->4
  <7> <6> <9> <3>
  <7 5>2 <_+>
}

\score {
  <<
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
