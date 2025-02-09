\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "Vivace"
    h''16\f g d g h,8 r r4
    g'16 e h e g,8 r r4
    e'16 c g c e,8 r r4
    r8 e'4 e8 cis8. cis16
    d a d8~ d d h8. h16
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "Vivace"
    g''16 d h d g,8 r r4
    e'16 h g h e,8 r r4
    c'16 g e g c,8 r r4
    g' r8 e4 a8~
    a fis d4 g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    r4 d'^\tutti d
    r h h
    r g g
    r8 e'4 e8 cis8. cis16
    d8 d4 d8 h8. h16
  }
}

SopranoLyrics = \lyricmode {
  San -- ctus,
  san -- ctus,
  san -- ctus,
  san -- ctus Do -- mi --
  nus, san -- ctus Do -- "mi -"
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    r4 g'8[^\tutti fis g fis]
    g4 g8[ fis g fis]
    e4 e8[ d e d]
    e4 r e8[ a]~
    a[ fis] d4 g
  }
}

AltoLyrics = \lyricmode {
  San --
  ctus, san --
  ctus, san --
  ctus, san --
  ctus "Do -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    r4 h8[^\tutti a g a]
    g4 r8 h[ e d]
    c4 c8[ h c h]
    c4 r8 c e16[ d e8]
    a,4 h4. h8
  }
}

TenoreLyrics = \lyricmode {
  San --
  ctus, san --
  ctus, san --
  ctus, san -- _
  ctus Do -- "mi -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    g'8.[^\tutti h32 a] g8[ d h d]
    e8.[ g32 fis] e8[ h g h]
    c8.[ e32 d] c8[ g' e g]
    c,4 r a'8 a
    fis8. fis16 g8 g4 g8
  }
}

BassoLyrics = \lyricmode {
  San -- _
  _ _
  _ _
  ctus, san -- ctus
  Do -- mi -- nus, san -- ctus
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 3/4 \tempoMarkup "Vivace"
    g'8.-\tutti h32 a g8 d h d
    e8. g32 fis e8 h g h
    c8. e32 d c8 g e g
    c,4 r a'8 a'
    fis4 g8 g4 g8
  }
}

BassFigures = \figuremode {
  r2 <6>4
  r2 q4
  r2 q4
  r2 <_+>4
  r2.
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
