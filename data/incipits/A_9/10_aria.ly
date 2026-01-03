\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 6/8 \tempoMarkup "Tempo sicilian[o]"
    \partial 8 r8-\conSord r4 g''8 b,8. a16 b8
    b4 a8 r4 d8
    es!4.~ es8. d16 cis8
    d4.~ d8. c16 h8
    c4.~ c8. b16 a8
    b4.~ b8. a16 g8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 6/8 \tempoMarkup "Tempo sicilian[o]"
    \partial 8 d'8-\conSord b8. a16 g8 g8. fis16 g8
    g4 fis8 fis8. g16 a8
    b8. a16 g8 b4 a16 g
    a8. g16 fis8 a4 g16 f
    g8. f16 e8 g4 f16 es
    f8. es16 d8 f4 es16 d
  }
}

Soli = {
  \relative c' {
    \clef soprano
    \key g \minor \time 6/8 \autoBeamOff \tempoMarkup "Tempo sicilian[o]"
    \partial 8 d'8 b4.~ b8. a16 g8
    g4\trill fis8 r r d'
    es!4. es8.[ d16] cis8
    d4.~ d8. c16 h8
    c4.~ c8. b16 a8
    b4.~ b8. a16 g8
  }
}

SoliLyrics = \lyricmode {
  Glückh -- ſee -- li -- ge
  Au -- gen! die
  ihr mit der
  Lau -- gen die
  Schwär -- tze der
  Sün -- den zu
}

Continuo = {
  \relative c {
    \clef bass
      \key g \minor \time 6/8 \tempoMarkup "Tempo sicilian[o]"
    \partial 8 r8 \mvTr g4\p-\markup \remark "sempre" es'!8 cis4 cis8
    d4 d8 d8. e16 fis8
    g4 g8 g4 g8
    fis4 fis8 f4 f8
    e4 e8 es4 es8
    d4 d8 d4 d8
  }
}

BassFigures = \figuremode {
  r8 r4. <7 5>
  <6 4>4 <5 _+>2
  <6->4. r4 <4\+ 2>8
  <6>4. r4 <4! 2>8
  <6>4. <\t>4 <4! 2>8
  <6>4. <\t>4 <4 2->8
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
        \set Staff.instrumentName = "St: Magdalena"
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
