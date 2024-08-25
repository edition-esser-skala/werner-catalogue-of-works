\version "2.24.2"
\include "header.ly"

Alto = {
  \relative c' {
    \clef alto
    \key h \minor \time 3/2 \autoBeamOff \tempoMarkup "Larghetto"
    R1.*2
    r2 fis4^\solo d h4.\trill cis16[ d]
    e4 cis ais2.\trill ais4
    h ais h2 r
    r r d4 cis8[ h]
  }
}

AltoLyrics = \lyricmode {
  Be -- _ ne -- _
  di -- _ ctus, qui
  ve -- _ nit,
  qui __ _
}

Tenore = {
  \relative c' {
    \clef tenor
    \key h \minor \time 3/2 \autoBeamOff \tempoMarkup "Larghetto"
    r2 fis4^\solo d h4. cis16[ d]
    e4 cis ais2.\trill ais4
    h ais h2 r
    r4 g fis ais cis e
    d fis8[ e] d2.\trill cis8[ h]
    a4 a g2~ g8[ fis] g4
  }
}

TenoreLyrics = \lyricmode {
  Be -- _ ne -- _
  di -- _ ctus, qui
  ve -- _ nit,
  qui ve -- _ nit, qui
  ve -- _ _ _
  nit, qui ve -- \hy
}

Organo = {
  \relative c {
    \clef bass
    \key h \minor \time 3/2 \tempoMarkup "Larghetto"
    h2-\solo d g
    cis, fis e
    d2. h4 g2
    e fis1
    h2 h'4 a8 g fis2
    cis h4 e h cis
  }
}

BassFigures = \figuremode {
  r1.
  r2 <_+> <\t>
  <6>1.
  <5>4 <6> <4>2 <_+>
  r1 <6>2
  q q2. \once \bassFigureExtendersOn q4
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
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/4) }
}
