\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    g''4. g8 a4. g16 f
    g4. g8 f2
    e4 r r2
    R1*2
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    e'4. e8 c4 f~
    f8 e16 d e4 d4. d8
    g,4 r r2
    R1*2
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Largo"
    c8 c16 c c8 c c c16 c c8 c
    c g16 g c4 r2
    R1*3
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    r8 g' c g \sbOn a16. c32 c16.\trill h64( c) f8 a,
    g16. c32 c16.\trill h64( c) e8 g, f h d f,
    e16.\trill d64( e) g16.\trill f64( g) c16.\trill h64( c) e16.\trill d64( e) \sbOff a16. e32 cis16. a32 e'16. \hA cis32 a16. e32
    \sbOn f16.\trill e64( f) a16.\trill g64( a) d16.\trill cis64( d) f16.\trill e64( f) \sbOff h16. fis32 dis16. h32 \hA fis'16. \hA dis32 h16. fis32
    \sbOn g16.\trill fis64( g) h16.\trill a64( h) e16.\trill dis64( e) g16.\trill fis64( g) \sbOff b16. g32 g16. e32 e4\trill
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    r8 g' c g \sbOn a16. c32 c16.\trill h64( c) f8 a,
    g16. c32 c16.\trill h64( c) e8 g, f h d f,
    e16.\trill d64( e) g16.\trill f64( g) c16.\trill h64( c) e16.\trill d64( e) \sbOff a16. e32 cis16. a32 e'16. \hA cis32 a16. e32
    \sbOn f16.\trill e64( f) a16.\trill g64( a) d16.\trill cis64( d) f16.\trill e64( f) \sbOff h16. fis32 dis16. h32 \hA fis'16. \hA dis32 h16. fis32
    \sbOn g16.\trill fis64( g) h16.\trill a64( h) e16.\trill dis64( e) g16.\trill fis64( g) \sbOff b16. g32 g16. e32 e4\trill
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    c'2.^\tutti c4
    c2 h
    c4 r r e
    e8[ d] d4 r fis
    fis8[ e] e4 r8 e e e
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus
  De -- _
  i, qui
  tol -- lis, qui
  tol -- lis pec -- ca -- ta
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    e4.^\tutti e8 f2~
    f4 e f4. e16[ d]
    e4 r r e
    f f r fis
    g g r8 g g g
  }
}

AltoLyrics = \lyricmode {
  A -- gnus De --
  i, De -- _
  i, qui
  tol -- lis, qui
  tol -- lis pec -- ca -- ta
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    g4.^\tutti c8 a4. a8
    g4 c d2
    g,4 r r a
    a a r h
    h h r8 b b b
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus De -- i,
  A -- gnus De --
  i, qui
  tol -- lis, qui
  tol -- lis pec -- ca -- ta
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    c2.^\tutti c4
    c1
    c4 r r cis
    d d r dis
    e e r8 cis cis cis
  }
}

BassoLyrics = \lyricmode {
  A -- gnus
  De --
  i, qui
  tol -- lis, qui
  tol -- lis pec -- ca -- ta
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Largo"
    c2~ c~
    c~ c~
    c4 r cis2
    d4 r dis2
    e r8 cis cis cis
  }
}

BassFigures = \figuremode {
  r2 <6 4>
  <5 4>4 <\t 3> <7 4 2>2
  <8 3>1
  <9>8 <8>4. r2
  <9\\>8 <8>2 <7- 5>4.
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
