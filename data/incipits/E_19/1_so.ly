\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    r4^\conSord r8 h' c16( es) g( f) g8 es
    es\trill d r es f16 g as8~ as g16 f \gotoBar "8"
    c,4 r r2
    \sbOn r16 es32( f \tuplet 3/2 8 { g16 f es) } es4 r2
    r16 g32( as \tuplet 3/2 8 { b16 as g) } g4 r2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    r4^\conSord r8 d es16( c) es'( d) es8 c
    c\trill h r c d es d16( c) d8 \gotoBar "8"
    c,4 r r2
    \sbOn r16 c32( d \tuplet 3/2 8 { es16 d c) } c4 r2
    r16 es32( f \tuplet 3/2 8 { g16 f es) } es4 r2
  }
}

Basso = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    \after 4*0 ^\markup \remark "Der zornige Richter" R1*2 \gotoBar "8"
    r4 r8 g'^\solo c es16[ d] c8 g
    es c r g' as c b, as'
    \appoggiatura as g4 r8 b c as f es
  }
}

BassoLyricsA = \lyricmode {
  \set stanza = "1. "
  So ſey es dan be --
  ſchloſ -- ſen, weil ſich der Sün -- der
  nicht zur Reu und Bueß will
}

BassoLyricsB = \lyricmode {
  \set stanza = "2. "
  Ver -- lan -- ge al -- le
  Gna -- den, die nur er -- denk -- lich
  ſeyn, laß mich den Sün -- der
}

BassoLyricsC = \lyricmode {
  \set stanza = "3. "
  Ô Muet -- ter dein Ver --
  lan -- gen iſt zwar der -- maſ -- ſen
  groß, doch bin ich faſt "be -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    c'8 es16 d c8 g es c r c
    g g' f es d c h4 \gotoBar "8"
    c8 es'16 d c8 g es c r h
    c4 c'8 es, f es d b
    es4 es'8 g, as4 a
  }
}

BassFigures = \figuremode {
  r4. <_!>8 r2
  <6 4>8 <5 _!> <\t \t> <6>4 <6->8 <7> <6>
  r4. <_!>8 r2
  r2 r8 <6> q4
  r1
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
    \new ChoirStaff \with { \setGroupDistance #18 #18 } <<
      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyricsA
      \new Lyrics \lyricsto Basso \BassoLyricsB
      \new Lyrics \lyricsto Basso \BassoLyricsC
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
