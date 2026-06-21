\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    R1
    r4 r8 c'' fis, fis g4~
    g8 g g fis g h,32( d16.) c32( e16.) d32( f16.)
    e8 e,16 f g8 a g e' g, a
    g e16 f g8 a g f g a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    R1
    r4 r8 e' d a g h
    e c a d h g32( h16.) a32( c16.) h32( d16.)
    c8 c,16 d e8 f e c' e, f
    e c16 d e8 f c d e f
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    r8 c'^\solo g a g e16 f g8 a
    a16[ g] g8 r c^\tutti a a g g
    c c a8. a16 h4 r
    c^\solo c8 c c4. c8
    c8. c,16 c4 e'16[ c] h[ d] c[ g] f[ e]
  }
}

SopranoLyrics = \lyricmode {
  Lau -- da -- te Do -- mi -- num, o -- mnes
  gen -- tes, lau -- da -- te e -- um,
  o -- mnes po -- pu -- li.
  Quo -- ni -- am con -- fir --
  ma -- ta est su -- per, su -- per
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    r8 c16[^\solo d] e8 f e c16 d e8 c16[ f]
    f[ e] e8 r a^\tutti fis fis e e
    g g g fis g4 r
    R1*2
  }
}

AltoLyrics = \lyricmode {
  Lau -- da -- te Do -- mi -- num, o -- mnes
  gen -- tes, lau -- da -- te e -- um,
  o -- mnes po -- pu -- li.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    R1
    r8 g^\tutti c4. c8 h h
    e e d8. d16 d4 r
    R1*2
  }
}

TenoreLyrics = \lyricmode {
  lau -- da -- te e -- um,
  o -- mnes po -- pu -- li.
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    R1
    r4 r8 a^\tutti d d e e
    c c d8. d16 g,4 r
    R1*2
  }
}

BassoLyrics = \lyricmode {
  lau -- da -- te e -- um,
  o -- mnes po -- pu -- li.
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    c4-\solo r c4. f8
    c4 r8 a-\tutti d4 e
    c d g, r
    R1*2
  }
}

BassFigures = \figuremode {
  r1
  <6 4>8 <5 3>4. <_+>4 <5>
  r <4>8 <_+> r2
  r1*2
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
