\version "2.24.2"
\include "header.ly"

\paper { indent = 1.5\cm }

ChalumeauI = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Allegro"
    b'16(\trill a) b8 r4 b16(\trill a) b8 r4
    c16( es) g8 f es d4 r8 d\p
    c16( es) g8 f es d4 f~\f
    f es2 d4~
    d c4. b16( a) b4
  }
}

ChalumeauII = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Allegro"
    r4 b'16(\trill a) b8 r4 b16(\trill a) b8~
    b es16( c) a b c8 f,4 r8 b~\p
    b es16 c a b c8 f,4 r8 d'\f
    g4. c,8 f4. b,8
    es4. a,8 d16( c) d8 r4
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Allegro"
    b'16(\f\trill a) b8 r4 b16(\trill a) b8 r4
    c16( es) g8 f es d16( b) f'( d) b'8 d,\p
    c16( es) g8 f es d b16\f d f8 b
    g4. c8 f,4. b8
    es,4. c'8 d,16( c) d8 r d'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Allegro"
    r4 b'16(\trill a) b8 r4 b16(\trill a) b8~
    b es16 c a b c8 b16 d, b' f d'8 b~\p
    b es16 c a b c8~ c b16\f d f4~
    f8 b, es4. a,8 d4~
    d8 g, c4. b16 a b( a) b8
  }
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Allegro"
    b'8 a g f g f es d
    es c f f, b4 r8 g'\p
    es c f f, b b'\f d, b
    es d c a d c b g
    c b a f b c d b
  }
}

BassFigures = \figuremode {
  r1
  <6 5>
  q2 r
  <9>4 <10> <9> <10>
  <9> <10> <9> <6>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "chalumeau"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ChalumeauI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ChalumeauII
        }
      >>
    >>
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
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
