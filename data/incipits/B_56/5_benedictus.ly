\version "2.24.2"
\include "header.ly"

TromboneI = {
  \relative c' {
    \clef alto
    \key f \major \time 3/2 \tempoMarkup "[no tempo]"
    c2-\solo f d
    c a r
    R1.*6
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key f \major \time 3/2 \tempoMarkup "[no tempo]"
    a1-\solo b2
    a f r
    R1.*6
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    R1.
    r2 c2^\solo d
    c a c
    f1.~
    f2 g f
    e1.~
    e2 d c
    h4 c d2. d4
  }
}

AltoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui
  ve --
  nit in
  no --
  mi -- ne,
  no -- _ _ "mi -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    R1.
    r2 a^\solo b
    a f r
    r a1
    d1.~
    d2 c h
    a1.~
    a2 g f
  }
}

TenoreLyrics = \lyricmode {
  Be -- ne --
  di -- ctus,
  qui
  ve --
  nit in
  no --
  mi -- ne
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 3/2 \tempoMarkup "[no tempo]"
    f1.-\solo
    f1 f2
    f1 e2
    d d' c
    h g h,
    c e1
    f2 f,1
    g2 h1
  }
}

BassFigures = \figuremode {
  r1 <6 4>2
  <5 3>1 <6 4>2
  <5 3>1.
  r1 <6 4>2
  <6 5>1.
  <9>2 <6> <5!>
  <7> <6> <5>
  <9 _!> <6> <5>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "trb"
        \new Staff {
          \set Staff.instrumentName = "1"
          \TromboneI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \TromboneII
        }
      >>
    >>
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
