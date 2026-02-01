\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    c16 c' h c d, h' a h g e' d e a, f' e f
    h,8 c d c16 h c8 e16 g d g c, g'
    h, g a f' g, e' f, d' e, f g a32 b c16 f, e b'
    a h c d32 e f16 g a8 d,16 f e c' d,8 h'
    c4 r r2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    c16 c' h c d, h' a h g e' d e a, f' e f
    h,8 c d c16 h c8 e16 g d g c, g'
    h, g a f' g, e' f, d' e, f g a32 b c16 f, e b'
    a h c d32 e f16 g a8 d,16 f e c' d,8 h'
    c4 r r2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    g'8[^\tutti c] h[ a] g[ e'] d[ c]
    h c d c16[ h] c8 e[ d] c
    h d c[ d] g,4 r
    a4. h16[ c] d8 c c[ h]
    c4 r8 g^\solo c8.[\trill h32 c] d8.[\trill c32 d]
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni -- bus bo -- nae
  vo -- lun -- ta -- tis,
  bo -- nae vo -- lun -- ta --
  tis. Lau -- da -- \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    e4^\tutti f g a
    g8 g a g g4 r
    r8 a[ g] f e g f[ g]
    c,4 f4. e8 d4
    e r r2
  }
}

AltoLyrics = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni -- bus
  bo -- nae vo -- lun -- ta --
  tis, vo -- lun -- ta --
  tis.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    c4^\tutti r8 d g,[ c] a[ f']
    d c a16[ f'] e[ d] e8 g,16[ a] h8 c
    d4 r r8 d[ c] b
    a g f g16[ a] g2
    g4 r r2
  }
}

TenoreLyrics = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni -- bus, ho -- mi -- ni --
  bus bo -- nae,
  bo -- nae vo -- lun -- ta --
  tis.
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    c4^\tutti d e f
    g8 e f g c, c'[ h] a
    g[ f] e[ d] c[ b'] a[ g]
    f[ e] d[ c] h! c g4
    c r r2
  }
}

BassoLyrics = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni -- bus bo -- nae
  vo -- lun -- ta -- tis,
  bo -- nae vo -- lun -- ta --
  tis.
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    c4-\tutti d e f
    g8 e f g c, c' h a
    g f e d c b a g
    << { f' e d c } \\ { f, } >> h8 c g' g,
    c16 e'-\solo d c h a g f e8 c h g
  }
}

BassFigures = \figuremode {
  r4 <6> q q8 <5>
  r <6> q2.
  r8 q q4. q8 q <6>
  r2 <6 5>4 <4>8 <3>
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
