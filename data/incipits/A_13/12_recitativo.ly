\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\part "Schöpffer" f, f16 f b f d8 d g16 g b g
    fis8 fis16 d a' \hA fis d a' b4 r8 \hA b
    f c es8. es16 d4 r8 f
    f f as g es es es16 es es f
    g8 g g16 b a e f8 f f16 f a f
  }
}

SoliLyrics = \lyricmode {
  Da -- mit dan al -- le Weld ver -- neh -- me und er --
  fah -- re, daß ich ohn -- end -- lich grecht, doch
  auch barm -- her -- zig ſey, ſo
  iſt es feſt -- ge -- ſtellt ich geb mein ein -- zign
  Sohn vors menſch -- li -- che Ge -- ſchlecht auf daß nun ſol -- cher
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    b2 g'4 es
    d fis g8 d16. b32 g4
    a2 b8 b' f d
    h2 c
    cis d4 a
  }
}

BassFigures = \figuremode {
  r2 <_->4 <6\\>
  <_+>2 <_->4 q
  <6>1
  <7- 5>2 <_->
  <7- 5>2. <6>4
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
