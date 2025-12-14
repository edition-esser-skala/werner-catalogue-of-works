\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]"
    r8 c'16 d e e, e'32 d c h c16 h h c32 d e16 e, e'32 d c h
    c16 h h c32 d e16 e, e'32 d c h c16. e32 a16. a,32 h8 gis'
    a,16 e' f g a e a32 g f e f8 f16 e d4~
    d16. e32 c16. d32 h4 a r8 a
    a,4 r8 a' a,4 d8 dis
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]"
    r8 c'16 d e e, e'32 d c h c16 h h c32 d e16 e, e'32 d c h
    c16 h h c32 d e16 e, e'32 d c h c16. e32 a16. a,32 h8 gis'
    a4 r r16 a, h c d a d32 c h a
    gis8 a4 gis8 a4 r8 a
    a,4 r8 a' a,4 d8 dis
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    r8 c'^\tutti e8. d16 c8 h16 h e8. d16
    c8 h e8. d16 c8 c h8. h16
    a4 r r2
    r r8 c16[^\solo d] e4~
    e8 c16[ d] e4. d16 c d8 c
  }
}

SopranoLyrics = \lyricmode {
  Lau -- da -- te pu -- e -- ri Do -- mi --
  num, lau -- da -- te no -- men Do -- mi --
  ni.
  Sit no --
  men Do -- mi -- ni be -- "ne -"
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    r8 a'^\tutti a h a gis16 gis a8 h
    a gis a h a a f e
    e4 r r2
    r r8 a16[^\solo h] c4~
    c8 a16[ h] c4. h16 a h8 a
  }
}

AltoLyrics = \lyricmode {
  Lau -- da -- te pu -- e -- ri Do -- mi --
  num, lau -- da -- te no -- men Do -- mi --
  ni.
  Sit no --
  men Do -- mi -- ni be -- "ne -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    r8 e^\tutti e e e e16 e e8 e
    e e e e e a, a gis
    a4 r r2
    R1*2
  }
}

TenoreLyrics = \lyricmode {
  Lau -- da -- te pu -- e -- ri Do -- mi --
  num, lau -- da -- te no -- men Do -- mi --
  ni.
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    r8 a'^\tutti c gis a e16 e c'8 gis
    a e c' gis a f d e
    a,4 r r2
    R1*2
  }
}

BassoLyrics = \lyricmode {
  Lau -- da -- te pu -- e -- ri Do -- mi --
  num, lau -- da -- te no -- men Do -- mi --
  ni.
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]"
    a8-\tutti a' c gis a e c' gis
    a e c' gis a f d e
    a, a-\solo c a d d f d
    e f d e a,4 r
    R1
  }
}

BassFigures = \figuremode {
  r4 <6>8 q4 r8 <6> q
  r4 <6>8 q4. <6 5>4
  r1
  <_+>4 <6 5>8 <_+> r2
  r1
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
