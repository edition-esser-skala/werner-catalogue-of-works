\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 3/4 \tempoMarkup "Larghetto" \autoBeamOff
    e'2^\solo a,4
    e' d c
    b a8[ gis] a4
    d c h
    a2 h4
    c2 d4
    e2 r4
    R2.*3
  }
}

SopranoLyrics = \lyricmode {
  Sal -- ve
  Re -- gi -- na,
  sal -- _ ve
  ma -- ter mi --
  se -- ri --
  cor -- di --
  ae.
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 3/4 \tempoMarkup "Larghetto" \autoBeamOff
    R2.*5
    r4 e^\solo a
    gis gis8[ a] h4
    a e8[ f] g4
    f a2
    d,4 g2
  }
}

AltoLyrics = \lyricmode {
  Vi -- ta,
  vi -- ta dul --
  ce -- do et
  spes no -- 
  stra, "no -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 3/4 \tempoMarkup "Larghetto" \autoBeamOff
    R2.*6
    r4 h^\solo e
    cis cis8[ d] e4
    d a8[ h] c4
    h2 c4
  }
}

TenoreLyrics = \lyricmode {
  Vi -- ta, %7
  vi -- ta dul --
  ce -- do et
  spes "no -"
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 3/4 \tempoMarkup "Larghetto"
    a4-\solo h c~
    c h a
    d e f~
    f e d
    c c' gis
    a g f
    e2 gis4
    a2 cis,4
    d f2
    g! e4
  }
}

BassFigures = \figuremode {
  r2 <6>4
  r <6\\>2
  <6->4 <_+> <6>
  r <6> <6!>
  <6>2.
  r2 <6>4
  <_+>2.
  q2 <5>4
  r <6> <5>
  r2 <6>4
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
