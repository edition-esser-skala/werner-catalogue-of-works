\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Largo"
    c'16(-\conSord b) a( b) c4 g16( f) e( f) g4 \gotoBar "7"
    R1
    r2 r4 r8 c~
    c16 b a g f8 f' d16( c) b( a) g8 f

  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Largo"
    a'16(-\conSord g) f( g) f4 e16( d) c( d) c4 \gotoBar "7"
    R1
    r2 r4 r8 g'
    a8. b16 c b a g f es d4 d'8
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    R1 \gotoBar "7"
    c4.^\solo \tuplet 3/2 8 { d16[ e f] } e8. e16 f[ c] c[ b]
    a8 f c' c d e16[ f] e[ d] c[ b]
    a4 c8 f d16[ c] b[ a] g8 f
  }
}

TenoreLyricsA = \lyricmode {
  \set stanza = "1. "
  Heut mueß je -- ne Son -- ne
  wei -- chen, die daß Rund der Weld be --
  leucht, Mond und Ster -- ne mueß "er -"
}

TenoreLyricsB = \lyricmode {
  \set stanza = "2. "
  Wer hat ſich wohl je er --
  khe -- ket, daß Er gründ -- lich ßa -- gen
  khan, kei -- ne Sünd hab ihn "be -"
}

TenoreLyricsC = \lyricmode {
  \set stanza = "3. "
  Sie al -- lein khan bil -- lich
  pran -- gen gleich der keu -- ſchen Li -- lien --
  blum, weil ſie oh -- ne Sünd "em -"
}

TenoreLyricsD = \lyricmode {
  \set stanza = "4. "
  So vill Not -- ten, ſo vill
  Kro -- nen wünſch -- te ich an -- jez zur
  Hand, dich Ma -- ri -- am zu "be -"
}

Chords = {
  \clef soprano
  \key f \major \time 4/4 \tempoMarkup "Largo"
  << \relative c' {
    s4 s16 a'' b c s4 s16 g a b \gotoBar "7"
    \oneVoice R1*3
  } \\ \relative c' {
    c'4~^\trill-\markup \remark "con Flauto" c16 f g a e4~^\trill e16 e f g
  } >>
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Largo"
    f8 c a f c' c' e, c \gotoBar "7"
    f, f' e d c c'16 b a8 e
    f a16 g a8 f b g c e,
    f f,16 g a8 f b4 h
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r2. <6>8 <5>
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
    \new ChoirStaff \with { \setGroupDistance #19 #19 } <<
      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyricsA
      \new Lyrics \lyricsto Tenore \TenoreLyricsB
      \new Lyrics \lyricsto Tenore \TenoreLyricsC
      \new Lyrics \lyricsto Tenore \TenoreLyricsD
    >>
    \new PianoStaff <<
      \set PianoStaff.instrumentName = \markup \center-column { "org" "solo" }
      \new Staff { \Chords }
      \new Staff {
        \set Staff.instrumentName = "b"
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
