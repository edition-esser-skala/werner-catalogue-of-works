\version "2.24.2"
\include "header.ly"

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    r4 d^\solo g a fis2
    g4 a h a g2
    fis4 g e8[ fis] g4 c,4. c8
    h4 d g8[ e] fis[ d] \grace d4 cis2\trill
    d r r
  }
}

AltoLyrics = \lyricmode {
  Sal -- ve Re -- gi --
  na, Re -- gi -- na ma --
  ter mi -- se -- ri -- cor -- di --
  ae, sal -- ve Re -- gi --
  na,
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    R1.*3
    r2 r4 a'2^\solo g8 a
    fis4 d a' c! h8[ a] g[ fis]
  }
}

BassoLyrics = \lyricmode {
  vi -- ta, dul --
  ce -- do et spes no -- stra,
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \tempoMarkup "Andante"
    g'4.-\solo a8 h4 c d c
    h fis g fis e a
    d, h c h a d
    g fis e d a' a,
    d e fis e dis h
  }
}

BassFigures = \figuremode {
  r1.
  r1 <7>4 <7 _+>
  r1 <7>4 q
  r2 <6\\> <4>4 <_+>
  r2. <6!>4 <6>2
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
