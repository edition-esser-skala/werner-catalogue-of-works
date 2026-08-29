\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Andante"
    \partial 8 d'8^\conSord g16 d b'8~ b16 g a fis g8 d~ d16[ b] \gotoBar "11" s8
    r4 r8 d~\p d16 b c a b8 g
    r4 r8 f'~ f16 d es c d8 b
    r4 r8 c~ c16 a b g a8 f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Andante"
    \partial 8 r8^\conSord b' d~ d16 b c a b g b8~ b16[ g] \gotoBar "11" s8
    r4 r8 a\p b16 g a fis g4
    r r8 a d16 b c a b4
    r r8 g a16 f g e f4
  }
}

Soli = {
  \relative c' {
    \clef soprano
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    \partial 8 r8 r2 r4 r8 \gotoBar "11" d'
    b g16[ a] b[ g] a[ fis] \hA \appoggiatura fis8 g4 r8 d'
    es16[ d] c[ b] a[ g] f[ es'] d8 b r d
    g, a16[ b] c8 b a f r a16[ b]
  }
}

SoliLyrics = \lyricmode {
  Ô
  Menſch dich nicht be -- trüeb! dein
  Gott iſt ſo ge -- ar -- thet, daß
  Er nur auff dich war -- thet, biß
}

Continuo = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Andante"
    \partial 8 r8 g' g, b d g,4 r8 \gotoBar "11" r
    g'4\p d g, r
    c f b, r
    es e f r
  }
}

BassFigures = \figuremode {
  r8 r4. <_+>8 r2
  r4 <6 4>8 <5 _+> r2
  r1
  r
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl · fl"
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
        \set Staff.instrumentName = "Barmh."
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
