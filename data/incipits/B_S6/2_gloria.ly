\version "2.24.2"
\include "header.ly"

OboeI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c''4 c8. c16 c8 e, d f
    e g32( f e d) e4 d r
    g g8. g16 g8 h, a c
    d2 e4 r
    r2 r4 r8 e16 f
  }
}

OboeII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    e'4 e8. e16 e8 c h d
    c-! e32( d c h) c4 h r
    h h8. h16 h8 g fis a
    h2 c4 r
    r2 r4 r8 c16 d
  }
}

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    e'4 e8. e16 e4 d8 d
    e e \grace f e4\trill d r
    d d8. d16 d4 r
    r8 g g f e4 r8 d
    \pa c4 g e c \pd
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c'4 c8. c16 c4 g
    c8 g g g16 g g4 r
    g g8. g16 g4 r
    r8 d' d d c4 r8 g
    c4 g e c
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c4 c8. c16 c4 g
    c c8 c16 c g4 r
    g g8. g16 g4 r
    r r8 g c4 r8 g
    c4 r c r
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c''4 c8. c16 c8 e,16 e d d f f
    e8-! g32( f e d) c16 e g c h8-! d32( c h a) h8-! h32( a g fis)
    g4 g8. g16 g8 h,16 h a a c c
    h8-! d32( c h a) g16 h d f! e8 g32( f e d) e8 e32( d c h)
    c4-! g-! e-! c-!
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    e'4 e8. e16 e8 c16 c h h d d
    c8-! e32( d c h) c16 e g e d8 h'32( a g fis) g8-! d32( c h a)
    h4 h8. h16 h8 g16 g fis fis a a
    g8 h32( a g fis) g16 h d h c8-! e32( d c h) c8 g32( f e d)
    c'4 g e c8 c'16 d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    c'4.^\tutti c8 c4 h8 d
    c c \grace d8 c4 h r
    d4. d8 d4 d8 d
    d d \grace e8 d4\trill c r
    c g e c
  }
}

SopranoLyrics = \lyricmode {
  Glo -- ri -- a in ex --
  cel -- sis De -- o,
  Glo -- ri -- a in ex --
  cel -- sis De -- o,
  et in ter -- ra
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    e4.^\tutti e8 e4 d8 f
    e e \grace f e4\trill d r
    g4. g8 g4 fis8 a
    g g g[ f] e4 r
    c' g e c
  }
}

AltoLyrics = \lyricmode {
  Glo -- ri -- a in ex --
  cel -- sis De -- o,
  Glo -- ri -- a in ex --
  cel -- sis De -- o,
  et in ter -- ra
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    g4.^\tutti g8 g4 g8 g
    g g g4 g r
    h4. h8 h4 a8 a
    h h h[ g] g4 r
    c g e c
  }
}

TenoreLyrics = \lyricmode {
  Glo -- ri -- a in ex --
  cel -- sis De -- o,
  Glo -- ri -- a in ex --
  cel -- sis De -- o,
  et in ter -- ra
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    c4.^\tutti c8 c4 g'8 h,
    c c c4 g' r
    g4. g8 g4 d8 fis
    g g g,4 c r
    c' g e c
  }
}

BassoLyrics = \lyricmode {
  Glo -- ri -- a in ex --
  cel -- sis De -- o,
  Glo -- ri -- a in ex --
  cel -- sis De -- o,
  et in ter -- ra
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8-\tutti c'16 h c g e g c,4 g'8 g,
    c c'16 h c8 c, g'4 r8 d
    g, g'16 fis g d h d g4 d'8 d,
    g, g'16 fis g8 g, c4 r8 g'
    c,4 r c r
  }
}

BassFigures = \figuremode {
  r2.. <7>8
  r2.. <_+>8
  r2. <_+>8 <7>
  r4. q8 r2
  r1
}

\score {
  <<
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { "ob" "1, 2" }
        \partCombine #'(0 . 10) \OboeI \OboeII
      >>
    >>
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { "clno" "1, 2" }
        \partCombine #'(0 . 10) \ClarinoI \ClarinoII
      >>
    >>
    \new Staff {
      \set Staff.instrumentName = "timp"
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
