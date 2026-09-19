\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/2 \tempoMarkup "Andante moderato"
    r4 e'8 d c4 h e, d
    c8 h c4 a'8 h c2 d4
    g, c2 c, h4
    c2 r r4 e'~
    e d2 c h4
    a g2 fis4 g2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/2 \tempoMarkup "Andante moderato"
    r4 c'8 h a4 e8 d c4 h
    a8 gis a4 r g' a4.\trill g16 f
    e4 g a4. a8 e4 g
    e2 r r4 c'~
    c h a8 g a2 g8 fis
    e4. e8 a,4 d h2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 3/2 \autoBeamOff \tempoMarkup "Andante moderato"
    a'2^\solo c4 h a gis
    a e r c' f2
    e4 c a f e d
    c2 r r
    R1.*2
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto --
  rem coe -- li et ter -- _
  rae,
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 3/2 \autoBeamOff \tempoMarkup "Andante moderato"
    R1.*6
  }
}

AltoLyrics = \lyricmode {
  %tacet
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 3/2 \autoBeamOff \tempoMarkup "Andante moderato"
    R1.*6
  }
}

TenoreLyrics = \lyricmode {
  %tacet
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 3/2 \autoBeamOff \tempoMarkup "Andante moderato"
    R1.*2
    r2 r g'8[^\solo a] h[ g]
    c4 h8 a \appoggiatura a g4. f8 e4 c'
    g2 fis g
    c, d4. d8 g,2
  }
}

BassoLyrics = \lyricmode {
  vi -- si --
  bi -- li -- um o -- mni -- um et
  in -- vi -- si --
  bi -- _ li -- um,
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 3/2 \tempoMarkup "Andante moderato"
    a'2-\solo r r
    r4 a8 g f4 e a, h
    c e f a g g,
    a2 h4 g c2
    g' fis g
    c, d g,4 g'
  }
}

BassFigures = \figuremode {
  r1.
  r2. r4 <6> <\t>
  r2. q4 <6 4> <5 3>
  r1.
  <6 4>4 <5 3> <6> <5> <4 2> <3 1>
  <6> <5> <4> <_+>2 <6>4
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
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
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
