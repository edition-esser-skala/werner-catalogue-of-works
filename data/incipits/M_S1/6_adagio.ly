\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Adagio ma poco"
    g'4.\p a8 b( c) d es16( d)
    es4. g,8 fis2
    g4. b'8 cis,4.\f d16( cis)
    d8 d, r a'' h,4. c16( h)
    c8 g g' es cis4. d16( cis)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Adagio ma poco"
    r4 g'4.\p a8 b4(
    h8) c16( h) c4. es8 d c~
    c b16 a b8 g r e'\f a,4~
    a8 fis d4 r8 d' g,4~
    g8 es c g'~ g a16 b a8( g)
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key g \minor \time 4/4 \tempoMarkup "Adagio ma poco"
    b4.\p c8 d( c) b( g)
    g'2 a4. a8
    d,2 r4 r8 e\f
    a,4 r r r8 d
    g,4 r r8 e' e e
  }
}

Cello = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Adagio ma poco"
    g'1~\p
    g~
    g2 r8 g4\f g8
    fis4 r r8 f4 f8
    es!4 r e2
  }
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
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
      \new Staff {
        \set Staff.instrumentName = "vla"
        \Viola
      }
      \new Staff {
        \set Staff.instrumentName = "vlc"
        \Cello
      }
    >>
  >>
}
