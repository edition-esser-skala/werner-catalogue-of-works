\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Recitativo"
    R1*2
    \tempoMarkup "Adagio" g''2 r8 g g g
    as as as as g4 r8 g~
    g g fis4 g g,
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Recitativo"
    R1*2
    \tempoMarkup "Adagio" e'2 r8 \hA e e e
    f f f f e4 c~
    c8 es d c c( h) h4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    R1*2
    \tempoMarkup "Adagio" b'2 r8 b b b
    as4. as8 g4 r8 g
    c es d c c[ h] h4
  }
}

SopranoLyrics = \lyricmode {
  Ô, ô har -- te
  Don -- ner -- worth! Wer
  wird al -- da be -- ſte -- hen!  finis
}

Alto = {
  \relative c' {
    \clef alto
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    R1*2
    \tempoMarkup "Adagio" g'2 r8 g g g
    f4. f8 e c es g
    g4 fis g g
  }
}

AltoLyrics = \lyricmode {
  Ô, ô har -- te
  Don -- ner -- worth! Wer wird al --
  da be -- ſte -- hen!  finis
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    R1*2
    \tempoMarkup "Adagio" e2 r8 \hA e e e
    d4. d8 g,4 r8 es'
    c4 a! d d
  }
}

TenoreLyrics = \lyricmode {
  Ô, ô har -- te
  Don -- ner -- worth! Wer
  wird be -- ſte -- hen!  finis
}

Basso = {
  \relative c {
    \clef alto
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\part "St: Michael" c' es16 es g c, as'8 as r f
    f as g d es es r4
    \clef bass \tempoMarkup "Adagio" des,2^\partBc r8 \hA des des des
    h4. h8 c4 r8 c'
    a!4. a8 g4 g
  }
}

BassoLyrics = \lyricmode {
  Auf, auf, ihr Tod -- ten, ey -- let! Ihr
  ſolt vor Grich -- te ge -- hen.
  Ô, ô har -- te
  Don -- ner -- worth! Wer
  wird be -- ſte -- hen!
}

Continuo = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \tempoMarkup "Recitativo"
    c2 h~
    h c8 c' g es
    \tempoMarkup "Adagio" des2 r8 \hA des des des
    h2 c4 c'
    a!2 g
  }
}

BassFigures = \figuremode {
  r2 <7- 5>
  <\t \t>1
  <6 4 2!>2 r8 <\t \t \t>4.
  <7- 5>2 <_!>4 <_->
  <7> <6\\> <4>8 <_!>4.
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
        \set Staff.instrumentName = \markup \center-column { "B" "soli" }
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
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
