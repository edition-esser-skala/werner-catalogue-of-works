\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    \after 4*0 -\conSord R2.
    r4 f' es8 d
    c( f,) f4 r
    r c' d
    es8 d es4 f
    d2 r4
    R2.
    r4 a8( b) b8.\trill a32( b)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    \after 4*0 -\conSord R2.
    r4 d' c8 b
    a2 r4
    r f8 g a4
    b2 c8( a)
    f2 r4
    R2.
    r4 f' f,
  }
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 3/4 \autoBeamOff \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    b'2^\solo a8[ g]
    f2 g4
    a2 b4
    c8[ f,] f4 r
    r g a
    b2 a8[ g]
    f4 g b,
    b8[ a] a4 r
  }
}

BassoLyricsA = \lyricmode {
  \set stanza = "1. "
  Schön -- ſte
  Jung -- frau
  un -- ter
  al -- len
  du al --
  lein haſt
  Gott _ ge --
  fal -- len
}

BassoLyricsB = \lyricmode {
  \set stanza = "2. "
  Es ſey
  tau -- ſent --
  mahl ge --
  priſ -- ſen
  Lob und
  Ehr zu --
  gleich _ er --
  wiſ -- ſen
}

BassoLyricsC = \lyricmode {
  \set stanza = "3. "
  Auch ge --
  be -- ne --
  dey -- te
  Au -- gen
  die ihr
  Je -- sum
  kon -- _ tet
  ſchau -- en
}

BassoLyricsD = \lyricmode {
  \set stanza = "4. "
  Ich mich
  mach zu
  dei -- nen
  Füeſ -- ſen
  will de --
  mie -- tig
  ſel -- _ be
  grieſ -- ſen
}

BassoLyricsE = \lyricmode {
  \set stanza = "5. "
  Daß du
  ſchwarz die
  Schrifft zwar
  ßa -- get
  ü -- ber
  daß zwar
  nie -- _ mandt
  kla -- get
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    b'4 b, c
    d2 es4
    f2 d4
    a a' f
    g2 a4
    b b, c
    d es g
    f2 d4
  }
}

BassFigures = \figuremode {
  r2 <6>4
  q2 q8 <5>
  r2 <6>4
  q2 q4
  <6->2 <6>4
  r2 q4
  r2.
  <4>4 <3> <6>
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
    \new ChoirStaff \with { \setGroupDistance #22 #22 } <<
      \new Staff {
        \set Staff.instrumentName = "Basso"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyricsA
      \new Lyrics \lyricsto Basso \BassoLyricsB
      \new Lyrics \lyricsto Basso \BassoLyricsC
      \new Lyrics \lyricsto Basso \BassoLyricsD
      \new Lyrics \lyricsto Basso \BassoLyricsE
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
