\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Adagio[se]"
    c'8-\conSord g16( f) es( g) d( g) es( c) g''8 f es~
    es d16 c d8.\trill c32( d) es8.\trill d32( es) \tuplet 3/2 8 { \sbOn f16 es d d c b \sbOff }
    b( as) g( f) es4 r r8 b'~
    b g'~ g16 f32 es d16 c b8 c16( es,) g8( f16.)\trill es32
    es8 g' g16( f) f,8 f16( es) es'8 es16( d) c8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Adagio[se]"
    es8-\conSord c16 h c8 g g es'' d c
    c h16( a) g4. c8 b8.\trill as16
    g( f) es( f) es4 r r8 f
    es es'~ es16 d32 c b16 as g8 es4 d8
    es es' es16( d) d,8 d16( c) c'8 as16 f es8
  }
}

Basso = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \tempoMarkup "Adagio[se]" \autoBeamOff
    r4 c'8 g es c as' c,
    c h g'8. f16 es8 c' b8. as16
    g[ as] g[ \hA as] b8 b, c c' d,8. es16
    es4 b'8 b, es16[ g] as[ c] b8 b,
    es4 r r2
  }
}

BassoLyricsA = \lyricmode {
  \set stanza = "1. "
  Al -- le Weld iſt nun be --
  tran -- get, an dem Joch der Ar -- mueth
  han -- get, wer hilfft wohl auß di -- ßer
  Noth, wer hilfft wohl auß di -- ßer
  Noth?
}

BassoLyricsB = \lyricmode {
  \set stanza = "2. "
  Ein Menſch jezt den an -- dren
  dru -- ket, nur der Ar -- me wird ge --
  zuk -- het, weiß nicht wo er Hilff mehr
  findt, weiß nicht wo er Hilff mehr
  findt.
}

BassoLyricsC = \lyricmode {
  \set stanza = "3. "
  Al -- le Lieb hat nun ein
  En -- de, Haß, Ver -- fol -- gung geht be --
  hän -- de je -- nen auf den Fueß -- trit
  nach, je -- nen auf den Fueß -- trit
  nach.
}

Organo = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \tempoMarkup "Adagio[se]"
    \mvTr c8\p-\markup \remark "sempre" es16 d c8 h c4 f
    g8 g,16 a h8 g c4 d8 b
    es8 es,16 f g4 as8 f b \hA as
    g[ es] b'4 es8 as b b,
    es4 b'8 h c c, f fis
  }
}

BassFigures = \figuremode {
  r2. <6 _->8 <5 \t>
  <4> <_!> r2 <6>4
  r1
  r4 <6 4>8 <5 3>4. <6 4>8 <5 3>
  r4 <6 4>8 <5 3> <9 4> <8 3> <7 _->16 <6 \t> <5 7->8
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
        \set Staff.instrumentName = "Basso"
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
