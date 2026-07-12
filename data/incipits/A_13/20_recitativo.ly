\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\part "Barmherzigkeit" a' e' g, f d' c16 c g a
    b8 d \hA b8. a16 a8 a \clef tenor r^\part "Gerechtigkeit" c,
    c16 c a c f8 f, d' d r16 d a b
    c8 c es c b b16 g es' c b g
    g8 d r4 \fC r8^\part "Adam" g h16 h c d
  }
}

SoliLyrics = \lyricmode {
  Ô groſ -- ſer Gott dir danck -- he ich daß
  du mein Bitt er -- hö -- ret. Wan
  du nicht hät -- teſt Gnad ge -- fun -- den ſo wär der
  Menſch ſchon ü -- ber -- wun -- den von Höl -- len -- brand ver --
  zeh -- ret. Da -- rum ſoll Gott von
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    cis2 d4 e
    e2 f
    a, fis
    fis' g4 c,
    d c h!2
  }
}

BassFigures = \figuremode {
  <6>2. <6>4
  <5->1
  <6>2 q
  <7- 5> <_->4 q
  <4> <4\+> <6>2
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "soli"
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
