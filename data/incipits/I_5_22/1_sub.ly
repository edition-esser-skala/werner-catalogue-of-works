\version "2.24.2"
\include "header.ly"

Alto = {
  \relative c' {
    \clef alto
    \key g \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    r2^\solo g'1^\aTre
    g2 fis d
    b'1 b2
    a d, a'~
    a g4 fis g2~
    g f1\trill
    e2 a, \hA e'~
    e d1
  }
}

AltoLyrics = \lyricmode {
  Sub
  tu -- um prae --
  si -- di --
  um con -- fu --
  _ _ _
  gi --
  mus, con -- fu --
  "gi -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1.*5
    r2 d1
    d2 cis a
    f'1 f2
  }
}

TenoreLyrics = \lyricmode {
  Sub %6
  tu -- um prae --
  si -- "di -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1.*2
    r2 g'1
    g2 fis d
    b'1 b2
    a1 d,2
    a'1 cis,2
    d f! d
  }
}

BassoLyrics = \lyricmode {
  Sub %3
  tu -- um prae --
  si -- di --
  um con --
  fu -- gi --
  mus, San -- cta
}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 3/2 \tempoMarkup "[no tempo]"
    g'2-\solo^\aTre b g
    d' d, fis
    g b, g
    d'1 fis2
    g1 g,2
    d'1 d2
    a'1 cis,2
    d f! d
  }
}

BassFigures = \figuremode {
  r1.
  <4>2 <_+>1
  r1.
  <4>2 <_+>1
  <9>2 <8>1
  <4>2 <_!>1
  <4>2 <_+>1
  <9>2 <6>1
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
