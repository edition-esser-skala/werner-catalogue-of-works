\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/2 \autoBeamOff \tempoMarkup "Vivace"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    r1 a'2. h4
    c d e fis g2 g,~
    g r r a
  }
}

SopranoLyrics = \lyricmode {
  Be -- _
  _ _ ne -- _ di -- ctus, __
  in
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/2 \autoBeamOff \tempoMarkup "Vivace"
      \set Staff.timeSignatureFraction = 2/2
    r1 r2 g'~
    g fis e2. fis4
    g e g1 fis2
    e r r e
    d4 e fis g a1
  }
}

AltoLyrics = \lyricmode {
  Be --
  ne -- di -- _
  _ _ _ _
  ctus, qui
  ve -- _ _ _ \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/2 \autoBeamOff \tempoMarkup "Vivace"
      \set Staff.timeSignatureFraction = 2/2
    r2 g2. a4 h cis
    d a d1 c2
    h2. cis4 d2 a~
    a4 h c a g a h c
    d2 d c4 d e fis
  }
}

TenoreLyrics = \lyricmode {
  Be -- _ ne -- _
  di -- _ ctus, qui
  ve -- _ nit, ve --
  _ _ _ _ _ _ _
  nit, qui ve -- _ _ \hy
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/2 \autoBeamOff \tempoMarkup "Vivace"
      \set Staff.timeSignatureFraction = 2/2
    g'1 e
    d a2 a'
    e1 d2 d'
    a1 e
    r2 h' a1
  }
}

BassoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui
  ve -- nit, qui
  ve -- nit,
  qui "ve -"
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/2 \tempoMarkup "Vivace"
      \set Staff.timeSignatureFraction = 2/2
    g'1 e
    d a'
    e d
    a' e
    h' a
  }
}

BassFigures = \figuremode {
  r1 <#(dotbf 5)>2. <6\\>4
  <4>2 <_+> <#(dotbf 5) 4> <_ 3>4 <6\\>
  <8 #(dotbf 5)>2. <_ 6\\>4 <8 4>2 <\t _+>
  <#(dotbf 5)>2. <6\\>4 r1
  <6>2 <5>4 <6> <8 #(dotbf 5)>2. <_ 6\\>4
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
