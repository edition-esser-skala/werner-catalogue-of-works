\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    R1
    r4 \tempoMarkup "Chorus" r es' r
    d r g, r
    cis e!8 a, \sbOn a32\f d' a fis d a' \hA fis d a \hA fis' d a fis d' a \hA fis \sbOff
    dis4 r r2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    R1
    r4 \tempoMarkup "Chorus" r c' r
    h! r c r
    g4. fis8 \sbOn a32\f d' a fis d a' \hA fis d a \hA fis' d a fis d' a \hA fis \sbOff
    dis4 r r2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    R1
    r4 \tempoMarkup "Chorus" d' r es
    r8 d16 d d d f es c8 c r c
    cis cis cis d d d r4
    R1
  }
}

SopranoLyrics = \lyricmode {
  Ach! ach!
  daß die Berg he -- rüe -- ber füeh -- len, uns
  ſambt -- lich zu be -- de -- ckhen!
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    R1
    r4 \tempoMarkup "Chorus" g' r a
    r8 d,16 d g g g g g8 g r g
    g g g fis fis fis r4
    R1
  }
}

AltoLyrics = \lyricmode {
  Ach! ach!
  daß die Berg he -- rüe -- ber füeh -- len, uns
  ſambt -- lich zu be -- de -- ckhen!
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    R1
    r4 \tempoMarkup "Chorus" d r c
    r8 h!16 h h h h c c8 c r c
    e! e e a, a a r4
    R1
  }
}

TenoreLyrics = \lyricmode {
  Ach! ach!
  daß die Berg he -- rüe -- ber füeh -- len, uns
  ſambt -- lich zu be -- de -- ckhen!
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\part "Judex" f16 f a a c a fis8 fis16 fis a a c b
    g8 g \tempoMarkup "Chorus" b4^\tutti r fis
    r8 f16 f f f f g es8 es r \hA es
    e e e d d d r4
    \clef alto r8^\part "St: Michael" h' fis'16 fis fis g e8. e16 e8 e
  }
}

BassoLyrics = \lyricmode {
  Nun werd ich mein Mueth er -- khiel -- len an di -- ſen La -- ſter --
  bö -- ckhen. Ach! ach!
  daß die Berg he -- rüe -- ber füeh -- len, uns
  ſambt -- lich zu be -- de -- ckhen!
  Her -- vor mit dir, du Gal -- gen -- zühr, nun
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    a2 c
    b4~ \tempoMarkup "Chorus" b fis'2
    f es
    e d4 r
    h!2 gis
  }
}

BassFigures = \figuremode {
  <6>2 <4\+ 2>
  <6> <7- 5>
  <4! 2> <6>
  <6\\> <_+>
  <_+> <6>
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
