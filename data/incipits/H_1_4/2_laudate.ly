\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/2 \tempoMarkup "[no tempo]"
    R1.*4
    r4 e' g e g8 g g g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/2 \tempoMarkup "[no tempo]"
    R1.*4
    r8 c' c c d4 c8 c h4 c
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    r2 r4 e'^\solo d c8[ h]
    a2. h8 c gis4. a8
    a2 r4 h c d
    e8[ f e f] g4 f \grace e8 d4. c8
    c c^\tutti c c d4 c8 c h4 c
  }
}

SopranoLyrics = \lyricmode {
  Lau -- da -- te
  pu -- e -- ri Do -- mi --
  num:  Lau -- da -- te
  no -- _ men Do -- mi --
  ni. Quis si -- cut Do -- mi -- nus De -- us
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    R1.
    r2 r4 f^\solo e8[ f] e[ d]
    c4 c8 d e4 f g a8[ h]
    c4 c, r a'^\tutti g8[ d] e[ f]
    e4 e g e g g
  }
}

AltoLyrics = \lyricmode {
  Sit no -- men
  Do -- mi -- ni be -- ne -- di -- _
  _ ctum, A so -- lis
  or -- tu us -- que ad "oc -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    R1.*2
    r2 r r4 d^\solo
    g, c8 d e4 d8 c h4. c8
    c2 r4 c^\tutti d e
  }
}

TenoreLyrics = \lyricmode {
  ex
  hoc nunc et us -- que in sae -- cu --
  lum. Ex -- cel -- sus
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    r4 a^\solo h c d e
    f e8 d c4 d e4. e8
    a,4 a' g! f e d
    c a' e f g4. g8
    c,4 c'^\tutti h c g e
  }
}

BassoLyrics = \lyricmode {
  Lau -- da -- _ te __ _
  pu -- e -- ri Do -- _ _ mi --
  num: Lau -- da -- te no -- _
  men, __ _ no -- men Do -- mi --
  ni. Ex -- cel -- sus su -- per
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 3/2 \tempoMarkup "[no tempo]"
    a'4-\solo a, h c d e
    f e8 d c4 d e e,
    a a' g! f e d
    c a' e f g g,
    c c'-\tutti h c g e
  }
}

BassFigures = \figuremode {
  r1.
  r2 <6> <_+>
  r1
  r2 <6> <4>4 <3>
  r2 r2. <6>4 %5
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
