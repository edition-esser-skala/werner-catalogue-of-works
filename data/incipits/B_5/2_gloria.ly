\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Tempo giusto"
    e'4. e16 f g4. g8
    g4 r8 c c( h) h4
    R1*4
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Tempo giusto"
    c'4. c8 d4. d8
    e4 r8 e e( d) d4
    R1*4
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Tempo giusto"
    c8 c16 c c8 c g g16 g g8 g
    c4 r8 c g g16 g g4
    R1*4
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Tempo giusto"
    e'8 c' g e d d' h d,
    e g c4. h,8 d'4~
    d8 e, c'4. d,8 h'4~
    h8 c, a'4. h,8 g'4~
    g8 a, f'4. f,8 f'4~
    f8 f, d'4. e,8 c'4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Tempo giusto"
    e'8 c' g e d d' h d,
    e e, e'4. d8 h' d,
    e c a'4. h,8 g'4~
    g8 a, fis' a, h g h e~
    e a, d4. d,8 d'4~
    d8 d, h'4. e,8 a4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo giusto"
    c'4^\tutti e d4. d8
    e4 r8 e e8. d16 d4
    e r d r
    c r8 c h8. h16 h4
    a r d r
    d r8 d d8. c16 c4
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni -- bus,
  pax, pax,
  pax ho -- mi -- ni -- bus,
  pax, pax,
  pax ho -- mi -- ni -- bus,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo giusto"
    g'4^\tutti g g4. g8
    g4 r8 g g8. g16 g4
    g r g r
    e r8 a g8. g16 g4
    g r f! r
    f r8 f e8. e16 e8 r
  }
}

AltoLyrics = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni -- bus,
  pax, pax,
  pax ho -- mi -- ni -- bus,
  pax, pax,
  pax ho -- mi -- ni -- bus,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo giusto"
    e4^\tutti c c h
    c r8 c c8. h16 h4
    c r d r
    e r8 d d8. d16 d4
    e r d r
    h! r8 h h8. a16 a4
  }
}

TenoreLyrics = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni -- bus,
  pax, pax,
  pax ho -- mi -- ni -- bus,
  pax, pax,
  pax ho -- mi -- ni -- bus,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo giusto"
    c4^\tutti c' g4. g8
    c,4 r8 c g'8. g16 g4
    c r h r
    a r8 fis g8. g16 g4
    cis, r b' r
    gis r8 \hA gis a8. a16 a4
  }
}

BassoLyrics = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni -- bus,
  pax, pax,
  pax ho -- mi -- ni -- bus,
  pax, pax,
  pax ho -- mi -- ni -- bus,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Tempo giusto"
    c4-\tutti c' g4. g8
    c,4 r8 c g'4 r8 g,
    c4 r8 a h4 r8 g
    a4 r8 fis g4 r8 e'
    cis4 r8 d b4 r8 b'
    gis4 r8 \hA gis a4 r8 f
  }
}

BassFigures = \figuremode {
  r2 <4>4 <3>
  r2 <6 4>8 <5 3>4.
  <9>8 <8>4. <9 7>8 <8 6>4.
  <9 7>8 <8 6>4 <6 5>8 <9> <8>4.
  <6 5>2 <5>
  <7 5>4. <\t \t>8 <9 4> <8 3>4.
}

\score {
  <<
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { \transposedNameShort "clno" "C" "" "1, 2" }
        \partCombine #'(0 . 10) \ClarinoI \ClarinoII
      >>
    >>
    \new Staff {
      \set Staff.instrumentName = \transposedTimpShort "C" "" "G" ""
      \Timpani
    }
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
        \set Staff.instrumentName = \markup \center-column { "A" "trb 1" }
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "T" "trb 2" }
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
