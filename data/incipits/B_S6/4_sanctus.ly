\version "2.24.2"
\include "header.ly"

OboeI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    g''2 fis
    g d~
    d4 c c2
    h2. c4
    h2 c4 r
  }
}

OboeII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    e'2 d
    d b~
    b4. a16 g a2
    gis2. a4~
    a gis a r
  }
}

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    e'2 fis
    g r
    g2. f!4
    R1
    r2 c4 r
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    c'2 d
    d r
    d4 c c2
    R1
    r2 e,4 r
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    c8 c16 c c8 c c4 r
    g8 g16 g g4 r2
    R1*3
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    c''8 c c c r16 a fis g a8 fis
    g g g g r16 b g a b8 g
    g g g g r16 c a b c8 a
    gis gis gis gis gis4 a~
    a gis r16. a32 gis16. f32 e16. d32 c16. h32
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    e'8 e e e r16 fis d e fis8 d
    d d d d r16 d b c d8 b
    b b c c r16 a' f g a8 f
    h, h h h h4 c
    h2 r16. c32 h16. d32 c16. h32 a16. gis32
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    c'2 c4. h16[ a]
    h2 b~
    b4. a16[ g] a2
    gis2. a4
    a( gis)\trill a r
  }
}

SopranoLyrics = \lyricmode {
  San -- _ _
  ctus, san --
  _ _
  _ ctus,
  san -- ctus,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    g'2^\tutti fis
    g g~
    g2. f4
    d2 e~
    e e4 r
  }
}

AltoLyrics = \lyricmode {
  San -- _
  ctus, san --
  ctus,
  san -- _
  ctus,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    e2^\tutti d
    d d~
    d4 c c2
    h2. c4
    h2\trill c4 r
  }
}

TenoreLyrics = \lyricmode {
  San -- _
  ctus, san --
  _ ctus,
  san -- _
  _ ctus,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    c1
    h2 g'
    e f~
    f e4 e
    e2 a,4 r
  }
}

BassoLyrics = \lyricmode {
  San --
  ctus, san --
  _ _
  _ ctus,
  san --
  ctus,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    c2-\tutti c
    h g'
    e f
    f e
    e a,4 r
  }
}

BassFigures = \figuremode {
  r2 <4\+ 2>
  <6> <_->
  <7 5->4 <6> <9> <8>
  <4 2\+>2 <5 _+>4 <6 4>
  <5 4> <\t _+>2.
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
