\version "2.24.2"
\include "header.ly"

OboeI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Allegro"
    c''2.
    h2 r4
    c2.
    h2 r4
    c2 h8 a
    g2.
  }
}

OboeII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Allegro"
    e'2.
    d2 r4
    e2.
    d2 r4
    e2 d4
    h2.
  }
}

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Allegro"
    e'4 r e
    d8 d16 d d4 r8 d
    e4 r e
    d8 d16 d d4 r8 d
    e4 r8 e16 e \pa d8 d \pd
    d4 r r
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Allegro"
    c' r c
    g8 g16 g g4 r8 g
    c4 r c
    g8 g16 g g4 r8 g
    c4 r8 c d d
    g,4 r r
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Allegro"
    c4 r c
    g8. g16 g4 r8 g
    c4 r c
    g8. g16 g4 r8 g
    c4 r r
    g r r
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Allegro"
    c''4 e,16 f g f e8 c'
    \grace c h8.\trill a32 h d4 \grace g,16 f8.\trill e32 f
    e4 e16( f g f) e8 c'
    \grace c h8.\trill a32 h d4 \grace g,16 f8.\trill e32 f
    e16( f g f) e8 c' h16 g a a
    << { g4 } \\ { h, } >> h16( c d c) h8 g'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Allegro"
    e'4 e16( f g f) e8 c'
    \grace c h8.\trill a32 h d4 \grace g,16 f8.\trill e32 f
    e4 e16( f g f) e8 c'
    \grace c h8.\trill a32 h d4 \grace g,16 f8.\trill e32 f
    e16( f g f) e8 e d16 g fis fis
    << { g4 } \\ { h, } >> h16( c d c) h8 g'
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/4 \tempoMarkup "Allegro" \autoBeamOff
    r4 c'^\tutti c
    h h8 h h h
    c2 c4
    h h8 h h h
    c2 h8[ a]
    h4. d8 d d
  }
}

SopranoLyrics = \lyricmode {
  Cre -- do,
  cre -- do in u -- num
  De -- um,
  Pa -- trem o -- mni -- po --
  ten -- _
  tem, fa -- cto -- rem
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \tempoMarkup "Allegro" \autoBeamOff
    r4 g'^\tutti g
    g g8 g g g
    g2 g4
    g g8 g g g
    g4. a8[ g fis]
    g4. g8 g g
  }
}

AltoLyrics = \lyricmode {
  Cre -- do,
  cre -- do in u -- num
  De -- um,
  Pa -- trem o -- mni -- po --
  ten -- _
  tem, fa -- cto -- rem
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/4 \tempoMarkup "Allegro" \autoBeamOff
    r4 e^\tutti e
    d d8 d d d
    e2 e4
    d d8 d d d
    e2( d4)
    d4. h8 h h
  }
}

TenoreLyrics = \lyricmode {
  Cre -- do,
  cre -- do in u -- num
  De -- um,
  Pa -- trem o -- mni -- po --
  ten --
  tem, fa -- cto -- rem
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Allegro" \autoBeamOff
    r4 c'^\tutti c
    g g8 g g g
    c2 c,4
    g' g8 g g g
    c4. a8 d4
    g,4. g8 g g
  }
}

BassoLyrics = \lyricmode {
  Cre -- do,
  cre -- do in u -- num
  De -- um,
  Pa -- trem o -- mni -- po --
  ten -- _ _
  tem, fa -- cto -- rem
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Allegro"
    c8-\tutti c'16 h c8 c, c'4
    g r8 g h d
    c c16 h c8 c, c'4
    g r8 g h d
    c4. a8 d d,
    g, g'16 fis g8 g, g'4
  }
}

BassFigures = \figuremode {
  r2.
  r2 <5>8 <6 5>
  r2.
  r2 <5>8 <6 5>
  r2 <6 4>8 <5 _+>
  r2.
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
