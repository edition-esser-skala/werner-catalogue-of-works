\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Allegro"
    r4 r16 e a c e e, gis h c e a c
    h e,, gis h c e a c h e,, gis h c e a c
    h e,, gis h e a, f' a, e8 a' h, gis'
    a,16 c' h a g f e d e8 c, r16 g' c e
    g g, h d e g c e, d g,, h d e g c e,
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Allegro"
    r4 r16 e a c e e, gis h c e a c
    h e,, gis h c e a c h e,, gis h c e a c
    h e,, gis h e a, f' a, e8 a' h, gis'
    a,16 c' h a g f e d e8 c, r16 g' c e
    g g, h d e g c e, d g,, h d e g c e,
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    r8 a'^\tutti c a e'8. e16 e4
    e8. e16 e8 e e4 e
    e4. f8 e4. e8
    e4 r r r8 e
    d g r e d d r e
  }
}

SopranoLyrics = \lyricmode {
  Lau -- da -- te pu -- e -- ri
  Do -- mi -- num: Lau -- da -- te
  no -- men Do -- mi --
  ni. Lau --
  da -- te, lau -- da -- te, "lau -"
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    r4 r8 a'^\tutti h gis r e
    h' gis r e h' gis r e
    h' gis a a a4 gis
    a r r8 c, e c
    g'! g16 g g8 g g4 g8 g
  }
}

AltoLyrics = \lyricmode {
  Lau -- da -- te, lau --
  da -- te, lau -- da -- te, lau --
  da -- te no -- men Do -- mi --
  ni. Sit no -- men
  Do -- mi -- ni be -- ne -- di -- ctum ex
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    r4 r8 c^\tutti h e r c
    h e r c h e r c
    h e e d c4 h8.\trill a16
    a4 r r r8 c
    d h r g g h r c
  }
}

TenoreLyrics = \lyricmode {
  Lau -- da -- te, lau --
  da -- te, lau -- da -- te, lau --
  da -- te no -- men Do -- _ mi --
  ni. Lau --
  da -- te, lau -- da -- te, "lau -"
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    r4 r8 a'^\tutti gis e r a
    gis e r a gis e r a
    gis e c d e4. e8
    a,4 r r r8 c'
    h g! r c, h g r c'
  }
}

BassoLyrics = \lyricmode {
  Lau -- da -- te, lau --
  da -- te, lau -- da -- te, lau --
  da -- te no -- men Do -- mi --
  ni. Lau --
  da -- te, lau -- da -- te, "lau -"
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Allegro"
    a4-\tutti r8 a' gis e r a
    gis e r a gis e r a
    gis e c d e d e e,
    a a' h g! c4 r8 c
    h g r c, h g r c'
  }
}

BassFigures = \figuremode {
  r1
  r
  r4 <6> <6 4> <5 _+>
  r1
  <6>2 q
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
