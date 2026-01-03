\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 12/8 \tempoMarkup "Allegro"
    d16 e f g a b a8 e' a, d b' d, cis4 a'8 \gotoBar "7"
    d, e cis d4 r8 f,\p g e d4 r8
    r2*3/2 r16 d'\f f d a'8 r16 g, b g d'8
    r16 c e c g'8 r16 f, a f c'8 r2*3/2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 12/8 \tempoMarkup "Allegro"
    f8 a f e a, a'~ a g16 a b8 e,16 d cis d e f \gotoBar "7"
    f8 g e d4 r8 d\p e cis d4 r8
    r2*3/2 r8 r16 a'\f f d b'8[ r16 d b g]
    e8[ r16 g e c] a' c f c a'8 r2*3/2
  }
}

Soli = {
  \relative c' {
    \clef tenor
    \key d \minor \time 12/8 \autoBeamOff \tempoMarkup "Allegro"
    R1. \gotoBar "7"
    r2*3/2 r4 r8 r4 a8
    d a d a f a f d r r4 r8
    r4 r8 r4 c'8 f c f c a c
  }
}

SoliLyrics = \lyricmode {
  Nun
  muß ich ver -- zweif -- fln, ver -- zweif -- fln,
  ſo kom -- met ihr Teuf -- fln, ihr
}

Continuo = {
  \relative c {
    \clef bass
    \key d \minor \time 12/8 \tempoMarkup "Allegro"
    d8 d' d cis c r h b r a e a, \gotoBar "7"
    b8 g a f' e d d'\p g, a d,4 r8
    r2*3/2 d4 r8 g4 r8
    c,4 r8 f4 r8 r2*3/2
  }
}

BassFigures = \figuremode {
  r2. r4. <_+>
  r8 <8 6> <5 _+> <6>4. r8 <8 6> <5 _+> r4.
  r1.
  r
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
        \set Staff.instrumentName = "Judas"
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
