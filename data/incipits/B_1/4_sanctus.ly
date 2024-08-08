\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    g''2 a4. a8
    a2 f4. f8
    e2 r\fermata
    a4. a8 fis4 g~
    g a g f
    e2 r\fermata
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    e'2 f4 e
    f c d c
    c2 r\fermata
    e4. e8 d2
    e4 c e c
    c2 r\fermata
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Largo"
    c8. c32 c c8 c c4 r
    r2 r4 c8 c16 c
    c2 r\fermata
    r2 r4 g8 g16 g
    c8. c32 c c8 c c8. c32 c c16 c c c
    c2 r\fermata
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    r16 c' e16. g32 c16. g32 g8\trill r16 a a8\trill r16 e e8\trill
    r16 f f8\trill r16 c c8\trill r16 d d8\trill r16 c f16. a32
    g16. c32 e,16. g32 c,4 r2\fermata
    r16 a cis16. e32 a16. e32 e8\trill r16 fis fis8\trill r16 g g8\trill
    r16 e e8\trill r16 f f8\trill r16 g g8\trill r16 c, f16. a32
    g16. e32 c16. g32 e4 r2\fermata
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    r16 e g16. c32 e16. e32 e8\trill r16 c c8\trill r16 cis cis8\trill
    r16 d d8\trill r16 a a8\trill r16 b b8\trill r16 a c16. f32
    e16. g32 c,16. e32 e,4 r2\fermata
    r16 cis e16. a32 cis16. cis32 cis8\trill r16 d d8\trill r16 b b8\trill
    r16 b b8\trill r16 a a8\trill r16 b b8\trill r16 a c16. f32
    e16. c32 g16. e32 c4 r2\fermata
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    c'2.^\tutti cis4
    d c d c
    c2 r\fermata
    cis d
    e4 f! g f
    e2 r\fermata
  }
}

SopranoLyrics = \lyricmode {
  San -- ctus,
  san -- ctus, san -- _
  ctus,
  san -- ctus,
  san -- ctus, san -- _
  ctus,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    e2^\tutti f4 e
    f1
    e2 r\fermata
    e2 fis4 g~
    g a b a
    g2 r\fermata
  }
}

AltoLyrics = \lyricmode {
  San -- _ ctus,
  san --
  ctus,
  san -- ctus, san --
  _ _ _
  ctus,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    g2^\tutti a
    a b4 a
    g2 r\fermata
    a a4 b~
    b a e' c
    c2 r\fermata
  }
}

TenoreLyrics = \lyricmode {
  San -- ctus,
  san -- _ _
  ctus,
  san -- ctus, san --
  ctus, san -- _
  ctus,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    c2^\tutti f4 a
    d, f b, f
    c'2 r\fermata
    a' d,4 g
    c, f! e f
    c2 r\fermata
  }
}

BassoLyrics = \lyricmode {
  San -- _ ctus,
  san -- ctus, san -- _
  ctus,
  san -- _ ctus,
  san -- ctus, san -- _
  ctus,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Largo"
    c2-\tutti f4 a
    d, f b, f
    c'2 r\fermata
    a' d,4 g
    c, f! e f
    c2 r\fermata
  }
}

BassFigures = \figuremode {
  r2. <_+>4
  r <5>2.
  r1
  <_+>2 q4 <_->
  <7->2 <5->
  r1
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
