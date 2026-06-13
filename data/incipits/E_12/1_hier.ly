\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    \partial 8 g''8 c c,16 d es8 es es\trill d r g
    c, f b, es es( d) r \gotoBar "4" s
    R1*3
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    \partial 8 r8 es' es,16 d c8 c' c b!16 as g \hA as b8
    es, as r g \hA as16 g f8 g \gotoBar "4" s
    R1*3
  }
}

Basso = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    \partial 8 r8 R1
    r2 r4 r8 \gotoBar "4" g'^\solo
    c c,16[ d] es8 es es[ d] r g
    c, f b, es es[ d] r c
    d es f16[ g] as8 as g r g
  }
}

BassoLyricsA = \lyricmode {
  \set stanza = "1. "
  Hier
  lig ich in der Bahr, die
  ich vill ban -- ge Jahr mein
  Nah -- men nach be -- ſtän -- dig und
}

BassoLyricsB = \lyricmode {
  \set stanza = "2. "
  Ich
  bin zwar oh -- ne Ruhm zum
  groſ -- ſen Für -- ſten -- thumb ein
  Für -- ſten -- toch -- ter gwe -- ßen, jezt
}

BassoLyricsC = \lyricmode {
  \set stanza = "3. "
  Ganz
  gern und un -- be -- ſchwert küß
  ich an -- jezt die Erd, hab
  zwar mein Herz ver -- loh -- ren, weillß
}

BassoLyricsD = \lyricmode {
  \set stanza = "4. "
  Fürſt
  E -- ſter -- ha -- ſiſch Hauß, jezt
  iſts mit mir halt auß, weil
  ich ins Grab ge -- ra -- then danckh
}

BassoLyricsE = \lyricmode {
  \set stanza = "5. "
  Ô
  lieb -- ſte Schwe -- ſtern mein, laßt
  mich noch eu -- er ſeyn, jezt
  thue ich Ur -- laub neh -- men, muß
}

BassoLyricsF = \lyricmode {
  \set stanza = "6. "
  Khomm
  ich vor Got -- tes Thron, will
  bet -- ten vor euch ſchon, daß
  er euch al -- len See -- gen gantz
}


Organo = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    \partial 8 r8 c4 r8 c g' g,16 as b!8 b
    b as r c' f, b es, \gotoBar "4" es16 d
    c4 r8 c g' g,16 as b!8 b
    b as r g' f b es, as~
    as g r f16 es d8 es16 f g8 es
  }
}

BassFigures = \figuremode {
  r8 r2 <6 4>8 <5 _->4.
  <4 2>8 <6>4. r2
  r <6 4>
  <4 2>8 <6>2.
  <2>1
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
    \new ChoirStaff \with { \setGroupDistance #25 #25 } <<
      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyricsA
      \new Lyrics \lyricsto Basso \BassoLyricsB
      \new Lyrics \lyricsto Basso \BassoLyricsC
      \new Lyrics \lyricsto Basso \BassoLyricsD
      \new Lyrics \lyricsto Basso \BassoLyricsE
      \new Lyrics \lyricsto Basso \BassoLyricsF
    >>
    \new Staff {
      \set Staff.instrumentName = \markup \center-column { "org" "b" }
      \Organo
    }
    \new FiguredBass { \BassFigures }
  >>
}
