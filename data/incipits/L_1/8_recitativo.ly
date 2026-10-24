\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8 a' a f16 a a8 e16 e g g a e
    fis8 fis16 fis a a c b g4 r16 b g f
    d8. a16 a4 r8 b d16 d d es
    f8 r16 a fis fis a d, b'4 r
  }
}

SoliLyrics = \lyricmode {
  Wohl ed -- le ge -- lieb -- te ver -- liebt und auch be --
  trüb -- te wer ſich will helf -- fen ſehn kan auf die
  Frey -- ung gehn, dort hab ich mei -- nen
  Stand wie je -- der -- man be -- kandt.
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    d2 cis
    c b
    a b
    a4 d g,16. b'32 g16. b32 d,16. g32 b,16. d32
  }
}

BassFigures = \figuremode {
  r1
  <4\+ 2>2 <6>
  <4>4 <_+>2.
  <6>4 <_+>2.
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "Arzt"
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
