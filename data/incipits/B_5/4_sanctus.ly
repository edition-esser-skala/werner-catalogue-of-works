\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    e'2 fis4 g~
    g fis g2
    R1*4
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    c'2 d4. e16 d
    c2\trill d
    R1*4
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Largo"
    R1*6
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    r16 c' e16. g32 c8 c,16. e32 d8 fis16. a32 d8 g,16. h32
    c8 c,16. e32 a8 a,16. c32 h8 d16. g32 b8 d,16. e32
    cis8 e16. \hA cis32 a'8 d,16. f32 h,8 d16. h32 g'8 c,16. e32
    a,8 a'16. c,32 h8 h'16. d,32 c8 c'16. e,32 d8 d'16. f,32
    e16. c32 e16. g32 c16. a,32 c16. e32 a16. d,,32 fis16. a32 h16. d32 g16. h32
    d,,8 d'' a, fis' g4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    r16 c' e16. g32 c8 c,16. e32 d8 fis16. a32 d8 g,16. h32
    c8 c,16. e32 a8 a,16. c32 h8 d16. g32 b8 d,16. e32
    cis8 e16. \hA cis32 a'8 d,16. f32 h,8 d16. h32 g'8 c,16. e32
    a,8 a'16. c,32 h8 h'16. d,32 c8 c'16. e,32 d8 d'16. f,32
    e16. c32 e16. g32 c16. a,32 c16. e32 a16. d,,32 fis16. a32 h16. d32 g16. h32
    d,,8 d'' a, fis' g h,4 c16 d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    c'4.^\tutti c8 d4. e16[ d]
    c8[ a] c4 h d
    cis d h c~
    c8 d4 e f g8
    e4. e8 d4 d
    d2 d8 h4 c16 d
  }
}

SopranoLyrics = \lyricmode {
  San -- ctus, san -- _
  _ _ ctus, san --
  _ ctus, san -- _
  _ _ _ ctus,
  san -- ctus, san -- ctus,
  san -- ctus Do -- mi -- nus
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    e2^\tutti fis4 g~
    g fis g g
    e f d e8 g
    c,[ f d g] e[ a] g4~
    g8 e a2 g4~
    g fis g r
  }
}

AltoLyrics = \lyricmode {
  San -- ctus, san --
  _ ctus, san --
  _ ctus, san -- ctus, san --
  _ _ _
  ctus, san -- _
  _ ctus
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    g2^\tutti a4 h
    c2 d4 b
    a4. a8 g2
    a4 h c d~
    d8[ c16 h] c2 h4
    a2 h8 g4 a16 h
  }
}

TenoreLyrics = \lyricmode {
  San -- ctus, _
  san -- ctus, san --
  _ ctus, san --
  _ _ _ _
  _ ctus,
  san -- ctus, Do -- mi -- nus
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    c'2.^\tutti h4
    a2 g4 g~
    g f!2 e4
    f g a h
    c a fis g
    d2 g,4 r
  }
}

BassoLyrics = \lyricmode {
  San -- ctus,
  san -- ctus, san --
  _ ctus,
  san -- _ _ _
  _ ctus, san -- ctus,
  san -- ctus
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Largo"
    <c c'>2.-\tutti h4
    a2 g4 g'~
    g f!2 e4
    f g a h
    c a fis g
    d2 g,8 \clef tenor g'4 a16 h
  }
}

BassFigures = \figuremode {
  r2 <4\+ 2>4 <6>
  <7> <6\\>2 <_->4
  <4\+ 2> <6> <4! 2> <6>
  <5>8 <6> <5> <6> <5> <6> <5> <6>
  <9> <8>4. <6 5>2
  <4>4 <_+>4. <10>4 q16 q
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
